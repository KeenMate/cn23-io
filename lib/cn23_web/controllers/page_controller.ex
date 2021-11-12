defmodule Cn23Web.PageController do
  use Cn23Web, :controller

  def index(conn, _params) do
    features = [
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

    conn
    |> put_layout({Cn23Web.LayoutView, "home/home.html"})
    |> assign(:features, features)
    |> render("index.html")
  end

  def releases(conn, _params) do
    releases = [
      %{
        date: "14 March 2020",
        title: "Release X",
        perex: "This release is a gamechanger for your user experience, because of the new...",
        author: "Filip Jakab",
        likes: 13,
        category: "Release",
        delay: nil
      },
      %{
        date: "14 March 2020",
        title: "Brexit underway",
        perex: "This release is a gamechanger for your user experience, because of the new...",
        author: "Filip Jakab",
        likes: 13,
        category: "News",
        delay: "0.2s"
      },
      %{
        date: "14 March 2020",
        title: "Release X",
        perex: "This release is a gamechanger for your user experience, because of the new...",
        author: "Filip Jakab",
        likes: 13,
        category: "Release",
        delay: "0.4s"
      },
      %{
        date: "14 March 2020",
        title: "Release X",
        perex: "This release is a gamechanger for your user experience, because of the new...",
        author: "Filip Jakab",
        likes: 13,
        category: "Release",
        delay: "0.6s"
      },
      %{
        date: "14 March 2020",
        title: "Release X",
        perex: "This release is a gamechanger for your user experience, because of the new...",
        author: "Filip Jakab",
        likes: 13,
        category: "Release",
        delay: nil
      },
    ]

    conn
    |> assign(:releases, releases)
    |> render("releases.html")
  end
end
