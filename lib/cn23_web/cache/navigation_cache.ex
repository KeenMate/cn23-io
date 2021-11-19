defmodule Cn23Web.Cache.NavigationCache do
  @table :navigation_cache

  @doc """
  Create a new ETS Cache if it doesn't already exists
  """
  def start do
    try do
      :ets.new(@table, [:set, :public, :named_table])

      :ok
    rescue
      ArgumentError -> {:error, :already_started}
    end
  end

  @doc """
  Retreive a value back from cache
  """
  def get(code) do
    case :ets.lookup(@table, code) do
      [{^code, value}] -> value
      _else -> nil
    end
  end

  @doc """
  Put a value into the cache
  """
  def put(key, value) do
    true = :ets.insert(@table, {key, value})
    :ok
  end

  @doc """
  Delete an entry from the cache
  """
  def delete(key) do
    true = :ets.delete(@table, key)
    :ok
  end

  @doc """
  Delete all objects from the cache
  """
  def flush() do
    :ets.delete_all_objects(@table)
    :ok
  end
end
