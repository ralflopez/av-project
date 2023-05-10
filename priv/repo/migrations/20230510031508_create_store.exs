defmodule AvProject.Repo.Migrations.CreateStore do
  use Ecto.Migration

  def change do
    create table(:store) do
      add :name, :string
      add :description, :string

      timestamps()
    end
  end
end
