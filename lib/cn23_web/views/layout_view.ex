defmodule Cn23Web.LayoutView do
  use Cn23Web, :view
  use Simplificator3000, :layout

  alias Cn23.Database.Models.GetNavigationItem

  # Phoenix LiveDashboard is available only in development by default,
  # so we instruct Elixir to not warn if the dashboard route is missing.
  @compile {:no_warn_undefined, {Routes, :live_dashboard_path, 2}}

  def build_navigation([], _), do: []
  def build_navigation(nil, _), do: []

  def build_navigation(items, depth) when is_list(items) do
    get_children = fn items, node_path ->
      Enum.filter(items, fn %{item: %{parent_path: parent}} -> parent == node_path end)
    end

    filter_by_level(items, depth)
    |> Enum.reverse()
    |> Enum.reduce([], fn level, acc ->
      Enum.map(level, fn item ->
        %{
          item: item,
          children: get_children.(acc, item.node_path)
        }
      end)
    end)
  end

  defp filter_by_level(items, depth) when is_list(items) do
    level_filter = fn level ->
      fn %GetNavigationItem{level: item_level} -> item_level == level end
    end

    1..depth
    |> Enum.map(&Enum.filter(items, level_filter.(&1)))
  end
end
