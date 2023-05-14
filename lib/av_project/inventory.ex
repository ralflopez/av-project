defmodule AvProject.Inventory do
  @moduledoc """
  The Inventory context.
  """

  import Ecto.Query, warn: false
  alias AvProject.Repo

  alias AvProject.Inventory.InventoryLogItem

  @doc """
  Returns the list of inventory_log_items.

  ## Examples

      iex> list_inventory_log_items()
      [%InventoryLogItem{}, ...]

  """
  def list_inventory_log_items do
    Repo.all(InventoryLogItem)
  end

  @doc """
  Gets a single inventory_log_item.

  Raises `Ecto.NoResultsError` if the Inventory log item does not exist.

  ## Examples

      iex> get_inventory_log_item!(123)
      %InventoryLogItem{}

      iex> get_inventory_log_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_inventory_log_item!(id), do: Repo.get!(InventoryLogItem, id)

  @doc """
  Creates a inventory_log_item.

  ## Examples

      iex> create_inventory_log_item(%{field: value})
      {:ok, %InventoryLogItem{}}

      iex> create_inventory_log_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_inventory_log_item(attrs \\ %{}) do
    %InventoryLogItem{}
    |> InventoryLogItem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a inventory_log_item.

  ## Examples

      iex> update_inventory_log_item(inventory_log_item, %{field: new_value})
      {:ok, %InventoryLogItem{}}

      iex> update_inventory_log_item(inventory_log_item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_inventory_log_item(%InventoryLogItem{} = inventory_log_item, attrs) do
    inventory_log_item
    |> InventoryLogItem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a inventory_log_item.

  ## Examples

      iex> delete_inventory_log_item(inventory_log_item)
      {:ok, %InventoryLogItem{}}

      iex> delete_inventory_log_item(inventory_log_item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_inventory_log_item(%InventoryLogItem{} = inventory_log_item) do
    Repo.delete(inventory_log_item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking inventory_log_item changes.

  ## Examples

      iex> change_inventory_log_item(inventory_log_item)
      %Ecto.Changeset{data: %InventoryLogItem{}}

  """
  def change_inventory_log_item(%InventoryLogItem{} = inventory_log_item, attrs \\ %{}) do
    InventoryLogItem.changeset(inventory_log_item, attrs)
  end

  alias AvProject.Inventory.InventoryLog

  @doc """
  Returns the list of inventory_logs.

  ## Examples

      iex> list_inventory_logs()
      [%InventoryLog{}, ...]

  """
  def list_inventory_logs do
    Repo.all(InventoryLog)
  end

  @doc """
  Gets a single inventory_log.

  Raises `Ecto.NoResultsError` if the Inventory log does not exist.

  ## Examples

      iex> get_inventory_log!(123)
      %InventoryLog{}

      iex> get_inventory_log!(456)
      ** (Ecto.NoResultsError)

  """
  def get_inventory_log!(id), do: Repo.get!(InventoryLog, id)

  @doc """
  Creates a inventory_log.

  ## Examples

      iex> create_inventory_log(%{field: value})
      {:ok, %InventoryLog{}}

      iex> create_inventory_log(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_inventory_log(attrs \\ %{}) do
    %InventoryLog{}
    |> InventoryLog.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a inventory_log.

  ## Examples

      iex> update_inventory_log(inventory_log, %{field: new_value})
      {:ok, %InventoryLog{}}

      iex> update_inventory_log(inventory_log, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_inventory_log(%InventoryLog{} = inventory_log, attrs) do
    inventory_log
    |> InventoryLog.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a inventory_log.

  ## Examples

      iex> delete_inventory_log(inventory_log)
      {:ok, %InventoryLog{}}

      iex> delete_inventory_log(inventory_log)
      {:error, %Ecto.Changeset{}}

  """
  def delete_inventory_log(%InventoryLog{} = inventory_log) do
    Repo.delete(inventory_log)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking inventory_log changes.

  ## Examples

      iex> change_inventory_log(inventory_log)
      %Ecto.Changeset{data: %InventoryLog{}}

  """
  def change_inventory_log(%InventoryLog{} = inventory_log, attrs \\ %{}) do
    InventoryLog.changeset(inventory_log, attrs)
  end
end
