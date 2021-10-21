defmodule Cn23Web.PageController do
  use Cn23Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
