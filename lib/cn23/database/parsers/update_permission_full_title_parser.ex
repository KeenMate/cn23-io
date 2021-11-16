# This code has been auto-generated
# Changes to this file will be lost on next generation

defmodule Cn23.Database.Parsers.UpdatePermissionFullTitleParser do
  @moduledoc """
  This module contains functions to parse output from db's stored procedure's calls
  """

  require Logger

  @spec parse_update_permission_full_title_result({:ok, Postgrex.Result.t()} | {:error, any()}) ::
          {:ok,
           [
             Cn23.Database.Models.UpdatePermissionFullTitleItem.t()
           ]}
          | {:error, any()}
  def parse_update_permission_full_title_result({:error, reason} = err) do
    Logger.error("Error occured while calling stored procedure",
      procedure: "update_permission_full_title",
      reason: inspect(reason)
    )

    err
  end

  def parse_update_permission_full_title_result({:ok, %Postgrex.Result{rows: rows}}) do
    Logger.debug("Parsing successful response from database")

    parsed_results =
      rows
      |> Enum.map(&parse_update_permission_full_title_result_row/1)

    # todo: Handle rows that could not be parsed

    successful_results =
      parsed_results
      |> Enum.filter(&(elem(&1, 0) == :ok))
      |> Enum.map(&elem(&1, 1))

    Logger.debug("Parsed response")

    {:ok, successful_results}
  end

  def parse_update_permission_full_title_result_row([
        created,
        created_by,
        modified,
        modified_by,
        permission_id,
        is_assignable,
        title,
        code,
        full_code,
        node_path,
        has_children,
        full_title
      ]) do
    {
      :ok,
      %Cn23.Database.Models.UpdatePermissionFullTitleItem{
        created: created,
        created_by: created_by,
        modified: modified,
        modified_by: modified_by,
        permission_id: permission_id,
        is_assignable: is_assignable,
        title: title,
        code: code,
        full_code: full_code,
        node_path: node_path,
        has_children: has_children,
        full_title: full_title
      }
    }
  end

  def parse_update_permission_full_title_result_row(_unknown_row) do
    Logger.warn("Found result row that does not have valid number of columns")

    {:error, :einv_columns}
  end
end