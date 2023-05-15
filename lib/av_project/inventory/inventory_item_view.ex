defmodule AvProject.Inventories.InventoryItemView do
  use Ecto.Schema

  @primary_key false
  schema "inventory_item_view" do
    field :product_id, :id
    field :sku, :string
    field :brand, :string
    field :category, :string
    field :description, :string
    field :name, :string
    field :price, :float

    field :id, :id
    field :quantity, :integer
    field :average_purchase_price, :float
    field :average_sale_price, :float
  end
end
