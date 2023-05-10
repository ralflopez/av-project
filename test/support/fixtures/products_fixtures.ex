defmodule AvProject.ProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AvProject.Products` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        brand: "some brand",
        category: "some category",
        description: "some description",
        name: "some name",
        price: 120.5
      })
      |> AvProject.Products.create_product()

    product
  end
end
