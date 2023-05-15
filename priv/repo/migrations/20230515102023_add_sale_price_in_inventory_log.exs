defmodule AvProject.Repo.Migrations.AddSalePriceInInventoryLog do
  use Ecto.Migration

  def change do
    alter table(:inventory_log_items) do
      add :sale_price, :float
    end

    execute("DROP VIEW IF EXISTS inventory_item_view;")

    execute("
      CREATE VIEW inventory_item_view as
      SELECT
      p.id as product_id,
      p.sku as sku,
      p.brand as brand,
      p.category as category,
      p.description as description,
      p.name as name,
      p.price as price,
      COALESCE(SUM(ili.quantity), 0) as quantity,
      COALESCE(AVG(ili.purchase_price), 0) as average_purchase_price,
      COALESCE(AVG(ili.sale_price), 0) as average_sale_price
      FROM products as p
      LEFT JOIN inventory_log_items as ili
      ON ili.product_id = p.id
      GROUP BY p.id;")
  end
end
