# This code has been auto-generated
# Changes to this file will be lost on next generation

defmodule Cn23.Database.Parsers.DeleteNavItemsParser do
  @moduledoc """
  This module contains functions to parse output from db's stored procedure's calls
  """

  require Logger

  @spec parse_delete_nav_items_result({:ok, Postgrex.Result.t()} | {:error, any()}) ::
          {:ok,
           [
             Cn23.Database.Models.DeleteNavItemsItem.t()
           ]}
          | {:error, any()}
  def parse_delete_nav_items_result({:error, reason} = err) do
    Logger.error("Error occured while calling stored procedure",
      procedure: "delete_nav_items",
      reason: inspect(reason)
    )

    err
  end

  def parse_delete_nav_items_result({:ok, %Postgrex.Result{rows: rows}}) do
    Logger.debug("Parsing successful response from database")

    parsed_results =
      rows
      |> Enum.map(&parse_delete_nav_items_result_row/1)

    # todo: Handle rows that could not be parsed

    successful_results =
      parsed_results
      |> Enum.filter(&(elem(&1, 0) == :ok))
      |> Enum.map(&elem(&1, 1))

    Logger.debug("Parsed response")

    {:ok, successful_results}
  end

  def parse_delete_nav_items_result_row([
        created,
        created_by,
        modified,
        modified_by,
        nav_item_id,
        nav_id,
        language_id,
        nav_state,
        nav_type,
        node_path,
        title,
        url,
        priority
      ]) do
    {
      :ok,
      %Cn23.Database.Models.DeleteNavItemsItem{
        created: created,
        created_by: created_by,
        modified: modified,
        modified_by: modified_by,
        nav_item_id: nav_item_id,
        nav_id: nav_id,
        language_id: language_id,
        nav_state: nav_state,
        nav_type: nav_type,
        node_path: node_path,
        title: title,
        url: url,
        priority: priority
      }
    }
  end

  def parse_delete_nav_items_result_row(_unknown_row) do
    Logger.warn("Found result row that does not have valid number of columns")

    {:error, :einv_columns}
  end
end