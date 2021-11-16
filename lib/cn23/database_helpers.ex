defmodule Cn23.Database.Helpers do
  def single_item(result) do
    case result do
      {:ok, [row | []]} -> {:ok, row}
      {:ok, [_row | rest] = items} when rest != [] -> {:error, {:single_item_expected, items}}
      {:error, rest} -> {:error, {:db_error, rest}}
    end
  end
end
