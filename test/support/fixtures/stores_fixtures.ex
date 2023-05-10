defmodule AvProject.StoresFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AvProject.Stores` context.
  """

  @doc """
  Generate a store.
  """
  def store_fixture(attrs \\ %{}) do
    {:ok, store} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> AvProject.Stores.create_store()

    store
  end
end
