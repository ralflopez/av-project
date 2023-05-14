defmodule AvProject.Repo.Migrations.CreateInventoryLogs do
  use Ecto.Migration

  def change do
    create table(:inventory_logs) do
      add :store_id, references(:store, on_delete: :delete_all)

      timestamps()
    end

    alter table(:inventory_log_items) do
      add :inventory_log_id, references(:inventory_logs, on_delete: :delete_all)
    end
  end
end
