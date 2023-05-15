defmodule AvProject.Queries.InventoryQuery do
  import Ecto.Query, warn: false

  alias AvProject.Inventories.InventoryLogItem
  alias AvProject.Queries.GenericQuery

  defdelegate by_store_id(query, id), to: GenericQuery
  defdelegate by_id(query, id), to: GenericQuery
  defdelegate select_all(query), to: GenericQuery

  def get_inventory_items_query(products) do
    product_ids = products |> Enum.map(&(&1.id))

    from ili in InventoryLogItem,
    where: ili.product_id in ^product_ids,
    group_by: ili.product_id,
    select: %{
      product_id: ili.product_id,
      quantity: sum(ili.quantity),
      average_purchase_price: avg(ili.purchase_price)
    }
  end
end
