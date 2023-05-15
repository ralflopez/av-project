defmodule AvProject.Inventories do
  @moduledoc """
  The Inventories context.
  """

  import Ecto.Query, warn: false
  import AvProject.Queries.InventoryQuery

  alias AvProject.Inventories.InventoryLogItem
  alias AvProject.Repo
  alias AvProject.Inventories.InventoryLog
  alias AvProject.Products.Product
  alias AvProject.Inventories.InventoryItemView

  @spec list_inventory_items(identifier())
   :: list(%InventoryItemView{})
  def list_inventory_items(store_id) do
    query = from iiv in InventoryItemView,
      join: p in Product,
      on: p.id == iiv.product_id,
      where: p.store_id == ^store_id,
      select: iiv

    query
    |> Repo.all
  end

  @spec add_inventory_log(identifier(), list(%InventoryLogItem{}), atom()) :: %InventoryLog{}
  def add_inventory_log(store_id, items, type) do
    handle_add_inventory_log(store_id, items, type)
  end

  defp handle_add_inventory_log(store_id, items, :incoming) do
    Repo.transaction(fn ->
        {:ok, inventory_log} =
          %InventoryLog{}
          |> InventoryLog.changeset(%{store_id: store_id})
          |> Repo.insert

        inventory_log_items =
          items
          |> attach_inventory_log_id(inventory_log.id)

        InventoryLogItem
        |> Repo.insert_all(inventory_log_items)

        inventory_log_items
    end)
  end

  defp handle_add_inventory_log(store_id, items, :outgoing) do
    Repo.transaction(fn ->
        {:ok, inventory_log} =
          %InventoryLog{}
          |> InventoryLog.changeset(%{store_id: store_id})
          |> Repo.insert

        # confirm stock
        product_quantity_query = from iiv in InventoryItemView,
          join: p in Product,
          on: p.id == iiv.product_id,
          where: p.store_id == ^store_id,
          select: %{
            product_id: iiv.product_id,
            quantity: iiv.quantity
          }

        product_quantities = product_quantity_query
        |> Repo.all

        insufficient_inventory =
          items
          |> Enum.filter(fn i ->
            product = Enum.find(product_quantities, &(&1.product_id == i.product_id))
            product.quantity < i.quantity
          end)
          |> length

        if insufficient_inventory > 0 do
          Ecto.Multi.rollback(:cancel, "Insufficient Stock")
        end

        inventory_log_items =
          items
          |> attach_inventory_log_id(inventory_log.id)

        InventoryLogItem
        |> Repo.insert_all(inventory_log_items)

        inventory_log_items
    end)
  end

  defp attach_inventory_log_id(inventory_log_items, inventory_log_id) do
    attach = fn i ->
        Map.put(i, :inventory_log_id, inventory_log_id)
    end

    inventory_log_items
    |> Enum.map(attach)
  end
end
