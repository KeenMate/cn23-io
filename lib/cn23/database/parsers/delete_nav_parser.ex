# This code has been auto-generated
# Changes to this file will be lost on next generation

defmodule Cn23.Database.Parsers.DeleteNavParser do
  @moduledoc """
  This module contains functions to parse output from db's stored procedure's calls
  """

  require Logger

  @spec parse_delete_nav_result({:ok, Postgrex.Result.t()} | {:error, any()}) ::
          {:ok,
           [
             Cn23.Database.Models.DeleteNavItem.t()
           ]}
          | {:error, any()}
  def parse_delete_nav_result({:error, reason} = err) do
    Logger.error("Error occured while calling stored procedure",
      procedure: "delete_nav",
      reason: inspect(reason)
    )

    err
  end

  def parse_delete_nav_result({:ok, %Postgrex.Result{rows: rows}}) do
    Logger.debug("Parsing successful response from database")

    parsed_results =
      rows
      |> Enum.map(&parse_delete_nav_result_row/1)

    # todo: Handle rows that could not be parsed

    successful_results =
      parsed_results
      |> Enum.filter(&(elem(&1, 0) == :ok))
      |> Enum.map(&elem(&1, 1))

    Logger.debug("Parsed response")

    {:ok, successful_results}
  end

  def parse_delete_nav_result_row([
        created,
        created_by,
        modified,
        modified_by,
        nav_id,
        code,
        nav_state_code,
        title
      ]) do
    {
      :ok,
      %Cn23.Database.Models.DeleteNavItem{
        created: created,
        created_by: created_by,
        modified: modified,
        modified_by: modified_by,
        nav_id: nav_id,
        code: code,
        nav_state_code: nav_state_code,
        title: title
      }
    }
  end

  def parse_delete_nav_result_row(_unknown_row) do
    Logger.warn("Found result row that does not have valid number of columns")

    {:error, :einv_columns}
  end
end