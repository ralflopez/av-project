defmodule AvProject.InventoryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AvProject.Inventory` context.
  """

  @doc """
  Generate a inventory_log_item.
  """
  def inventory_log_item_fixture(attrs \\ %{}) do
    {:ok, inventory_log_item} =
      attrs
      |> Enum.into(%{
        purchase_price: 120.5,
        quantity: 42
      })
      |> AvProject.Inventory.create_inventory_log_item()

    inventory_log_item
  end

  @doc """
  Generate a inventory_log.
  """
  def inventory_log_fixture(attrs \\ %{}) do
    {:ok, inventory_log} =
      attrs
      |> Enum.into(%{

      })
      |> AvProject.Inventory.create_inventory_log()

    inventory_log
  end
end
