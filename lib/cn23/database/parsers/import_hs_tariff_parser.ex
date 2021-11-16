# This code has been auto-generated
# Changes to this file will be lost on next generation

defmodule Cn23.Database.Parsers.ImportHsTariffParser do
  @moduledoc """
  This module contains functions to parse output from db's stored procedure's calls
  """

  require Logger

  @spec parse_import_hs_tariff_result({:ok, Postgrex.Result.t()} | {:error, any()}) ::
          {:ok,
           [
             Cn23.Database.Models.ImportHsTariffItem.t()
           ]}
          | {:error, any()}
  def parse_import_hs_tariff_result({:error, reason} = err) do
    Logger.error("Error occured while calling stored procedure",
      procedure: "import_hs_tariff",
      reason: inspect(reason)
    )

    err
  end

  def parse_import_hs_tariff_result({:ok, %Postgrex.Result{rows: rows}}) do
    Logger.debug("Parsing successful response from database")

    parsed_results =
      rows
      |> Enum.map(&parse_import_hs_tariff_result_row/1)

    # todo: Handle rows that could not be parsed

    successful_results =
      parsed_results
      |> Enum.filter(&(elem(&1, 0) == :ok))
      |> Enum.map(&elem(&1, 1))

    Logger.debug("Parsed response")

    {:ok, successful_results}
  end

  def parse_import_hs_tariff_result_row([node_path, code, code2, desc, expl]) do
    {
      :ok,
      %Cn23.Database.Models.ImportHsTariffItem{
        node_path: node_path,
        code: code,
        code2: code2,
        desc: desc,
        expl: expl
      }
    }
  end

  def parse_import_hs_tariff_result_row(_unknown_row) do
    Logger.warn("Found result row that does not have valid number of columns")

    {:error, :einv_columns}
  end
end