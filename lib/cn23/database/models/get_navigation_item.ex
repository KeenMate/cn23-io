# This code has been auto-generated
# Changes to this file will be lost on next generation

defmodule Cn23.Database.Models.GetNavigationItem do
  @fields [
    :level,
    :parent_path,
    :node_path,
    :nav_type,
    :title,
    :url,
    :priority
  ]

  @enforce_keys @fields

  defstruct @fields

  @type t() :: %Cn23.Database.Models.GetNavigationItem{}
end