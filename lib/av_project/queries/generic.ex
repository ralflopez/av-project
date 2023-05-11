defmodule AvProject.Queries.GenericQuery do
  import Ecto.Query, warn: false

  def by_store_id(query, store_id) do
    from q in query,
      where: q.store_id == ^store_id
  end

  def by_id(query, id) do
    from q in query,
    where: q.id == ^id
  end

  def select_all(query) do
    from q in query,
    select: q
  end
end
