defmodule AvProject.Products do
  @moduledoc """
  The Products context.
  """

  import Ecto.Query, warn: false
  import AvProject.Queries.ProductQuery

  alias AvProject.Repo
  alias AvProject.Products.Product

  @doc """
  Returns the list of products by store_id.

  ## Examples

      iex> list_products(store_id)
      [%Product{}, ...]

  """
  def list_products(store_id) do
    Product
    |> by_store_id(store_id)
    |> Repo.all
  end

  # defp by(store_id) do
  #   from p in Product,
  #     join: s in Store,
  #     on: p.store_id == s.id,
  #     where: p.store_id == ^store_id,
  #     select: p
  # end

  @doc """
  Gets a single product by store_id.

  Raises `Ecto.NoResultsError` if the Product does not exist.

  ## Examples

      iex> get_product!(store_id, 123)
      %Product{}

      iex> get_product!(store_id, 456)
      ** (Ecto.NoResultsError)

  """
  def get_product!(store_id, id) do
    Product
    |> by_store_id(store_id)
    |> by_id(id)
    |> select_all
    |> Repo.one
  end

  @doc """
  Creates a product.

  ## Examples

      iex> create_product(%{field: value})
      {:ok, %Product{}}

      iex> create_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a product.

  ## Examples

      iex> update_product(product, %{field: new_value})
      {:ok, %Product{}}

      iex> update_product(product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a product.

  ## Examples

      iex> delete_product(product)
      {:ok, %Product{}}

      iex> delete_product(product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking product changes.

  ## Examples

      iex> change_product(product)
      %Ecto.Changeset{data: %Product{}}

  """
  def change_product(%Product{} = product, attrs \\ %{}) do
    Product.changeset(product, attrs)
  end
end
