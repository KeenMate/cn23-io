defmodule Cn23Web.Plugs.PutNavigation do
  import Plug.Conn
  import Cn23.Navigation

  def init(navs), do: navs

  def call(conn, navs) do
    with {:ok, navigation} <- collect(navs) do
      conn
      |> assign(:navigation, navigation)
    else
      err -> {:error, {:fetch_navigation, err}}
    end
  end

  defp collect(navs) do
    Enum.reduce_while(navs, {:ok, Map.new()}, fn nav, {:ok, acc} ->
      with {:ok, items} <- get_navigation(nav, 1) do
        {:cont, {:ok, Map.put(acc, nav, items)}}
      else
        err -> {:halt, err}
      end
    end)
  end
end
