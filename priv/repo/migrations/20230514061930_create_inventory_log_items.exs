defmodule AvProject.Repo.Migrations.CreateInventoryLogItems do
  use Ecto.Migration

  def change do
    create table(:inventory_log_items) do
      add :quantity, :integer
      add :purchase_price, :float
      add :product_id, references(:products, on_delete: :delete_all)
    end
  end
end
