defmodule Cn23.News do
  @news %{
    1 => %{
      id: 1,
      date: "14 March 2020",
      title: "Release X",
      perex: "This release is a gamechanger for your user experience, because of the new...",
      author: "Filip Jakab",
      likes: 13,
      category: "Releases",
      content:
        "In this release we decided collectively and unanimously that we are going to please your senses with our brand new feature that has never been presented on planet Earth."
    },
    2 => %{
      id: 2,
      date: "14 March 2020",
      title: "Release X",
      perex: "This release is a gamechanger for your user experience, because of the new...",
      author: "Filip Jakab",
      likes: 13,
      category: "Releases",
      content:
        "In this release we decided collectively and unanimously that we are going to please your senses with our brand new feature that has never been presented on planet Earth."
    },
    3 => %{
      id: 3,
      date: "14 March 2020",
      title: "Release X",
      perex: "This release is a gamechanger for your user experience, because of the new...",
      author: "Filip Jakab",
      likes: 13,
      category: "Releases",
      content:
        "In this release we decided collectively and unanimously that we are going to please your senses with our brand new feature that has never been presented on planet Earth."
    },
    4 => %{
      id: 4,
      date: "14 March 2020",
      title: "Release X",
      perex: "This release is a gamechanger for your user experience, because of the new...",
      author: "Filip Jakab",
      likes: 13,
      category: "Releases",
      content:
        "In this release we decided collectively and unanimously that we are going to please your senses with our brand new feature that has never been presented on planet Earth."
    },
    5 => %{
      id: 5,
      date: "14 March 2020",
      title: "Release X",
      perex: "This release is a gamechanger for your user experience, because of the new...",
      author: "Filip Jakab",
      likes: 13,
      category: "Releases",
      content:
        "In this release we decided collectively and unanimously that we are going to please your senses with our brand new feature that has never been presented on planet Earth."
    },
    6 => %{
      id: 6,
      date: "14 March 2020",
      title: "Release X",
      perex: "This release is a gamechanger for your user experience, because of the new...",
      author: "Filip Jakab",
      likes: 13,
      category: "Releases",
      content:
        "In this release we decided collectively and unanimously that we are going to please your senses with our brand new feature that has never been presented on planet Earth."
    }
  }

  def get_news() do
    Map.values(@news)
  end

  def get_news_detail(id) do
    @news[id]
  end
end
