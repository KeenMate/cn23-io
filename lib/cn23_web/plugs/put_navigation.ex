defmodule Cn23Web.Plugs.PutNavigation do
  import Plug.Conn
  import Cn23.Navigation

  alias Cn23Web.Cache.NavigationCache

  def init(navs), do: navs

  def call(conn, navs) do
    assign(conn, :navigation, collect(navs))
  end

  defp collect(navs) do
    Enum.reduce(navs, Map.new(), fn nav, acc -> Map.put(acc, nav, retrieve_navigation(nav, 1)) end)
  end

  defp retrieve_navigation(code, language_id) do
    case NavigationCache.get({code, language_id}) do
      nil -> cache_navigation(code, language_id)
      items -> items
    end
  end

  defp cache_navigation(code, language_id) do
    with {:ok, items} <- get_navigation(code, language_id) do
      NavigationCache.put({code, language_id}, items)

      items
    else
      _ -> []
    end
  end
end
