defmodule Cn23.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema
  use PowAssent.Ecto.Schema

  import Ecto.Changeset

  @primary_key {:user_id, :id, autogenerate: true}
  @timestamps_opts [type: :utc_datetime]
  @derive {Jason.Encoder, only: [:user_id, :display_name, :email]}

  schema "users" do
    pow_user_fields()

    timestamps()
  end

  def changeset(user_or_changeset, attrs) do
    attrs = map_name_to_display_name(attrs)

    user_or_changeset
    |> cast(attrs, [:display_name])
    |> validate_required([:display_name])
    |> pow_changeset(attrs)
    |> unique_constraint(:email, name: "uq_user_info")
  end

  def user_identity_changeset(user_or_changeset, user_identity, attrs, user_id_attrs) do
    attrs = map_name_to_display_name(attrs)

    user_or_changeset
    |> cast(attrs, [:display_name])
    |> validate_required([:display_name])
    |> pow_assent_user_identity_changeset(user_identity, attrs, user_id_attrs)
    |> unique_constraint(:email, name: "uq_user_info")
  end

  defp map_name_to_display_name(attrs) do
    case Map.pop(attrs, "name") do
      {nil, attrs} -> attrs
      {name, attrs} -> Map.put(attrs, "display_name", name)
    end
  end
end
