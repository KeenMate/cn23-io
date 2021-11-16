defmodule Cn23Web.LayoutView do
  use Cn23Web, :view
  use Simplificator3000, :layout

  alias Cn23.Database.Models.GetNavigationItem

  # Phoenix LiveDashboard is available only in development by default,
  # so we instruct Elixir to not warn if the dashboard route is missing.
  @compile {:no_warn_undefined, {Routes, :live_dashboard_path, 2}}

  def build_navigation(items) when is_list(items) do
    [level_one, level_two, level_three] = filter_by_level(items)

    mapped_three = Enum.map(level_three, fn item -> %{item: item, children: []} end)

    mapped_two =
      Enum.map(level_two, fn item ->
        %{
          item: item,
          children:
            Enum.filter(mapped_three, fn %{item: child} -> child.parent_path == item.node_path end)
        }
      end)

    mapped_one =
      Enum.map(level_one, fn item ->
        %{
          item: item,
          children:
            Enum.filter(mapped_two, fn %{item: child} -> child.parent_path == item.node_path end)
        }
      end)

    mapped_one
  end

  defp filter_by_level(items) when is_list(items) do
    level_filter = fn level -> fn %GetNavigationItem{level: item_level} -> item_level == level end end

    [
      Enum.filter(items, level_filter.(1)),
      Enum.filter(items, level_filter.(2)),
      Enum.filter(items, level_filter.(3))
    ]
  end
end
