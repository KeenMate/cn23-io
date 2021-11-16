# This code has been auto-generated
# Changes to this file will be lost on next generation

defmodule Cn23.Database.Models.DeleteNavItemItem do
  @fields [
    :created,
    :created_by,
    :modified,
    :modified_by,
    :nav_item_id,
    :nav_id,
    :language_id,
    :nav_state,
    :nav_type,
    :node_path,
    :title,
    :url,
    :priority
  ]

  @enforce_keys @fields

  defstruct @fields

  @type t() :: %Cn23.Database.Models.DeleteNavItemItem{}
end