defmodule AvProject.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  alias AvProject.Stores.Store

  schema "products" do
    field :brand, :string
    field :category, :string
    field :description, :string
    field :name, :string
    field :price, :float

    belongs_to :store, Store

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:brand, :name, :description, :category, :price, :store_id])
    |> validate_required([:brand, :name, :description, :category, :price])
  end
end
