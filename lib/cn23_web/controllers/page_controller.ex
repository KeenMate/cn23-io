defmodule Cn23Web.PageController do
  use Cn23Web, :controller

  plug Cn23Web.Plugs.PutNavigation, ["main", "footer"]
  plug :put_layout, {Cn23Web.LayoutView, "home/home.html"}

  def index(conn, _params) do
    conn
    |> assign(:features, features())
    |> render("index.html")
  end

  def features(conn, _params) do
    conn
    |> render("features.html")
  end

  def technologies(conn, _params) do
    conn
    |> render("technologies.html")
  end

  def motivation(conn, _params) do
    conn
    |> render("motivation.html")
  end

  def contact(conn, _params) do
    conn
    |> render("contact.html")
  end

  defp features() do
    [
      %{
        icon: "Cursor-Click2",
        title: "First feature",
        text: "Very important message we are about to tell you",
        delay: nil
      },
      %{
        icon: "Cursor-Click2",
        title: "First feature",
        text: "Very important message we are about to tell you",
        delay: "0.2s"
      },
      %{
        icon: "Cursor-Click2",
        title: "First feature",
        text: "Very important message we are about to tell you",
        delay: "0.4s"
      },
      %{
        icon: "Cursor-Click2",
        title: "First feature",
        text: "Very important message we are about to tell you",
        delay: "0.6s"
      }
    ]
  end
end
