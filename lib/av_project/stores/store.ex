defmodule AvProject.Stores.Store do
  use Ecto.Schema
  import Ecto.Changeset

  alias AvProject.Products.Product

  schema "store" do
    field :description, :string
    field :name, :string

    has_many :products, Product

    timestamps()
  end

  @doc false
  def changeset(store, attrs) do
    store
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
