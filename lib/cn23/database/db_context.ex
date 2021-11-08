# This code has been auto-generated
# Changes to this file will be lost on next generation

defmodule Cn23.Database.DbContext do
  @moduledoc """
  This module contains functions for calling DB's stored procedures.
  Functions of this module uses `query/2` function of Repo that you have provided (`db_config` key of configuration)
  """

  require Logger

  import Elixir.Cn23.Repo, only: [query: 2]

  @spec not_accessible(integer(), binary(), binary()) :: {:error, any()} | {:ok, [any()]}
  def not_accessible(user_id, perm_code, data_node_path) do
    Logger.debug("Calling stored procedure", procedure: "not_accessible")

    query(
      "select * from public.not_accessible($1, $2, $3)",
      [user_id, perm_code, data_node_path]
    )
    |> Cn23.Database.Parsers.NotAccessibleParser.parse_not_accessible_result()
  end
end