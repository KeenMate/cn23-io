defmodule Cn23Web.ComponentsView do
  use Cn23Web, :view

  def features(features) when is_list(features),
    do: render("features/features.html", %{features: features})

  def feature(icon, title, text, delay),
    do: feature(%{icon: icon, title: title, text: text, delay: delay})

  def feature(%{icon: _, title: _, text: _, delay: _} = params),
    do: render("features/feature.html", params)
end
