defmodule Cn23Web.NewsController do
  use Cn23Web, :controller

  import Cn23.News

  plug Cn23Web.Plugs.PutNavigation, ["main"]

  def news(conn, _params) do
    conn
    |> assign(:news, get_news())
    |> render("list.html")
  end

  def news_detail(conn, _params) do
    conn
  end
end
