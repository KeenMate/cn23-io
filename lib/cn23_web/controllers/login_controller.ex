defmodule Cn23Web.LoginController do
  use Cn23Web, :controller

  def login_page(conn, _params) do
    changeset = Pow.Plug.change_user(conn)

    render(conn, "login.html", changeset: changeset)
  end

  def login(conn, %{"user" => user_params}) do
    conn
    |> Pow.Plug.authenticate_user(user_params)
    |> case do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, conn} ->
        changeset = Pow.Plug.change_user(conn, conn.params["user"])

        conn
        |> put_flash(:info, "Invalid email or password")
        |> render("login.html", changeset: changeset)
    end
  end

  def logout(conn, _params) do
    conn
    |> Pow.Plug.delete()
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
