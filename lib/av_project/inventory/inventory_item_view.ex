defmodule AvProject.Inventories.InventoryItemView do
  use Ecto.Schema
  import Ecto.Changeset

  alias AvProject.Products.Product

  @primary_key false
  schema "inventory_item_view" do
    field :sku, :string
    field :brand, :string
    field :category, :string
    field :description, :string
    field :name, :string
    field :price, :float

    field :product_id, :id
    field :quantity, :integer
    field :average_purchase_price, :float
  end
end
