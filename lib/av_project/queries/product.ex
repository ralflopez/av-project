defmodule AvProject.Queries.ProductQuery do
  alias AvProject.Queries.GenericQuery

  defdelegate by_store_id(query, id), to: GenericQuery
  defdelegate by_id(query, id), to: GenericQuery
  defdelegate select_all(query), to: GenericQuery
end
