defmodule Cn23.Navigation do
  import Cn23.Database.Helpers

  alias Cn23.Database.DbContext
  alias Cn23.UserContext

  def create_navigation(%UserContext{name: username, id: user_id}, code, title, visibility) do
    DbContext.create_nav(username, user_id, code, title, visibility)
    |> single_item()
  end

  def set_nav_visibility(%UserContext{name: username, id: user_id}, navigation_id, visibility) do
    DbContext.set_nav_visibility(username, user_id, navigation_id, visibility)
    |> single_item()
  end

  def create_nav_item(%UserContext{name: username, id: user_id}, navigation_id, language_id, title, parent_item_id \\ nil, url \\ nil, type \\ "STATPAGE", visibility \\ "HIDDEN", priority \\ nil) do
    DbContext.create_nav_item(username, user_id, navigation_id, language_id, title, parent_item_id, url, type, visibility, priority)
    |> single_item()
  end

  def get_navigation(code, language_id) do
    DbContext.get_navigation(code, language_id)
  end
end
