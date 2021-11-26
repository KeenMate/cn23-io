defmodule Cn23Web.NewsView do
  use Cn23Web, :view

  def news_item_link(conn, id) do
    Routes.news_path(conn, :news_item, locale(conn), id)
  end

  def delay_news(news, columns) do
    news
    |> Enum.chunk_every(columns)
    |> Enum.map(&delay_row(&1))
    |> List.flatten()
  end

  defp delay_row(row) do
    row
    |> Enum.map_reduce(0, fn news, delay ->
      {Map.put(news, :delay, if delay == 0 do nil else "0.#{delay}s" end), delay + 2}
    end)
    |> elem(0)
  end
end
