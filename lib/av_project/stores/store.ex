defmodule AvProject.Stores.Store do
  use Ecto.Schema
  import Ecto.Changeset

  alias AvProject.Products.Product
  alias AvProject.Accounts.User
  alias AvProject.Inventories.InventoryLog

  schema "store" do
    field :description, :string
    field :name, :string

    has_many :products, Product
    has_many :users, User
    has_many :inventory_logs, InventoryLog

    timestamps()
  end

  @doc false
  def changeset(store, attrs) do
    store
    |> cast(attrs, [:name, :description])
    |> validate_required([:name])
  end
end
