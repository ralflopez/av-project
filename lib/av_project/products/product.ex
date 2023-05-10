defmodule AvProject.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :brand, :string
    field :category, :string
    field :description, :string
    field :name, :string
    field :price, :float

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:brand, :name, :description, :category, :price])
    |> validate_required([:brand, :name, :description, :category, :price])
  end
end
