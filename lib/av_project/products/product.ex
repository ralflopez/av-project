defmodule AvProject.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  alias AvProject.Stores.Store
  alias AvProject.Inventory.InventoryLogItem

  schema "products" do
    field :sku, :string
    field :brand, :string
    field :category, :string
    field :description, :string
    field :name, :string
    field :price, :float

    belongs_to :store, Store
    has_many :inventory_log_items, InventoryLogItem

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:sku, :brand, :name, :description, :category, :price, :store_id])
    |> validate_required([:sku, :brand, :name, :description, :category, :price])
    |> unique_constraint([:sku])
  end
end
