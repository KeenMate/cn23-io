defmodule Cn23Web.NewsController do
  use Cn23Web, :controller

  import Cn23.News

  plug Cn23Web.Plugs.PutNavigation, ["main"]

  def news(conn, _params) do
    conn
    |> assign(:news, get_news())
    |> render("list.html")
  end

  def news_item(conn, %{"id" => id}) do
    with {id, _} <- Integer.parse(id),
         post when not is_nil(post) <- get_news_item(id) do
      conn
      |> assign(:item, post)
      |> put_news_meta_tags(post)
      |> render("item.html")
    else
      :error ->
        {:error, :invalid_id}

      nil ->
        {:error, :post_not_found}
    end
  end

  defp put_news_meta_tags(conn, post) do
    conn
    |> put_meta_tag("author", post.author)
    |> put_meta_tag("og:title", post.title)
    |> put_meta_tag("og:type", "article")
  end
end
