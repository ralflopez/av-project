defmodule AvProject.Repo.Migrations.AddStoreInUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :store_id, references(:store, on_delete: :nilify_all)
    end
  end
end
