defmodule Cn23.UserIdentities.UserIdentity do
  use Ecto.Schema
  use PowAssent.Ecto.UserIdentities.Schema, user: Cn23.Users.User

  @primary_key {:user_identity_id, :id, autogenerate: true}
  @pow_assent_assocs []
  @timestamps_opts [type: :utc_datetime]

  schema "user_identities" do
    pow_assent_user_identity_fields()

    belongs_to :user, Cn23.Users.User, references: :user_id

    timestamps()
  end
end
