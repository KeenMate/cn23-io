defmodule Cn23Web.PageController do
  use Cn23Web, :controller

  plug Cn23Web.Plugs.PutNavigation, ["main", "footer"]
  plug :put_layout, {Cn23Web.LayoutView, "home/home.html"}

  def index(conn, _params) do
    conn
    |> assign(:features, features())
    |> render("index.html")
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
