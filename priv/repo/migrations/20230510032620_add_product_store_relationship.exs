defmodule AvProject.Repo.Migrations.AddProductStoreRelationship do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :store_id, references(:store, on_delete: :delete_all)
    end
  end
end
