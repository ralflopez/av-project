defmodule AvProject.Inventory.InventoryLogItem do
  use Ecto.Schema
  import Ecto.Changeset

  alias AvProject.Inventory.InventoryLog
  alias AvProject.Products.Product

  schema "inventory_log_items" do
    field :purchase_price, :float
    field :quantity, :integer

    belongs_to :inventory_log, InventoryLog
    belongs_to :product, Product
  end

  @doc false
  def changeset(inventory_log_item, attrs) do
    inventory_log_item
    |> cast(attrs, [:quantity, :purchase_price, :product_id])
    |> validate_required([:quantity, :purchase_price, :product_id])
  end
end