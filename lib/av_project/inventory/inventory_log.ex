defmodule AvProject.Inventory.InventoryLog do
  use Ecto.Schema
  import Ecto.Changeset

  alias AvProject.Stores.Store
  alias AvProject.Inventory.InventoryLogItem

  schema "inventory_logs" do
    belongs_to :store, Store
    has_many :items, InventoryLogItem

    timestamps()
  end

  @doc false
  def changeset(inventory_log, attrs) do
    inventory_log
    |> cast(attrs, [:store_id])
    |> validate_required([:store_id])
  end
end
