defmodule AvProject.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :brand, :string
      add :name, :string
      add :description, :string
      add :category, :string
      add :price, :float

      timestamps()
    end
  end
end
