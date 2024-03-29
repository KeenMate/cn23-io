defmodule Cn23Web do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, views, channels and so on.

  This can be used in your application as:

      use Cn23Web, :controller
      use Cn23Web, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define any helper function in modules
  and import those modules here.
  """

  def controller do
    quote do
      use Phoenix.Controller, namespace: Cn23Web
      use Simplificator3000, :controller

      import Plug.Conn
      import Cn23Web.Gettext
      alias Cn23Web.Router.Helpers, as: Routes

      unquote(locale_helpers())

      def put_meta_tag(conn, name, content) do
        tags = conn.private[:meta_tags] || []

        put_private(conn, :meta_tags, tags ++ [%{name: name, content: content}])
      end
    end
  end

  def view do
    quote do
      use Phoenix.View,
        root: "lib/cn23_web/templates",
        namespace: Cn23Web,
        pattern: "**/*"

      use Simplificator3000, :view

      # Import convenience functions from controllers
      import Phoenix.Controller,
        only: [get_flash: 1, get_flash: 2, view_module: 1, view_template: 1]

      # Include shared imports and aliases for views
      unquote(view_helpers())
    end
  end

  def live_view do
    quote do
      use Phoenix.LiveView,
        layout: {Cn23Web.LayoutView, "live.html"}

      unquote(view_helpers())
    end
  end

  def live_component do
    quote do
      use Phoenix.LiveComponent

      unquote(view_helpers())
    end
  end

  def router do
    quote do
      use Phoenix.Router

      import Plug.Conn
      import Phoenix.Controller
      import Phoenix.LiveView.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import Cn23Web.Gettext
    end
  end

  defp view_helpers do
    quote do
      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      # Import LiveView and .heex helpers (live_render, live_patch, <.form>, etc)
      import Phoenix.LiveView.Helpers

      # Import basic rendering functionality (render, render_layout, etc)
      import Phoenix.View

      import Cn23Web.ErrorHelpers
      import Cn23Web.Gettext
      alias Cn23Web.Router.Helpers, as: Routes
      alias Cn23Web.ComponentsView, as: Components

      unquote(locale_helpers())

      defmacro meta_tags(conn) do
        quote do
          for %{name: name, content: content} <- unquote(conn).private[:meta_tags] || [] do
            tag(:meta, name: name, content: content)
          end
        end
      end
    end
  end

  defp locale_helpers do
    quote do
      defp locale(conn), do: conn.params["locale"] || nil
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
