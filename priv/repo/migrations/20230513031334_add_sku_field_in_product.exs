defmodule AvProject.Repo.Migrations.AddSkuFieldInProduct do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :sku, :string
    end

    create unique_index(:products, [:sku])
  end
end
