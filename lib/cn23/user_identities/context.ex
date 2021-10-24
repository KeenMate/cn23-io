defmodule Cn23.UserIdentities.Context do
  use PowAssent.Ecto.UserIdentities.Context, repo: Cn23.Repo, user: Cn23.Users.User

  alias Pow.Ecto.Context

  def get_user_by_provider_uid(provider, uid) do
    pow_assent_get_user_by_provider_uid(provider, uid)
  end

  def upsert(user, user_identity_params) do
    params = convert_params(user_identity_params)
    {uid_provider_params, additional_params} = Map.split(params, ["uid", "provider"])

    user
    |> get_for_user(uid_provider_params)
    |> case do
      nil -> insert_identity(user, params)
      identity -> update_identity(identity, additional_params)
    end
    |> user_identity_bound_different_user_error()
  end

  defp user_identity_bound_different_user_error({:error, %{errors: errors} = changeset}) do
    case unique_constraint_error?(errors, :uid_provider) do
      true -> {:error, {:bound_to_different_user, changeset}}
      false -> {:error, changeset}
    end
  end

  defp user_identity_bound_different_user_error(any), do: any

  defp convert_params(params) when is_map(params) do
    params
    |> Enum.map(&convert_param/1)
    |> :maps.from_list()
  end

  defp convert_param({:uid, value}), do: convert_param({"uid", value})
  defp convert_param({"uid", value}) when is_integer(value), do: convert_param({"uid", Integer.to_string(value)})
  defp convert_param({key, value}) when is_atom(key), do: {Atom.to_string(key), value}
  defp convert_param({key, value}) when is_binary(key), do: {key, value}

  defp insert_identity(user, user_identity_params) do
    user_identity = Ecto.build_assoc(user, :user_identities)

    user_identity
    |> user_identity.__struct__.changeset(user_identity_params)
    |> Context.do_insert(@pow_config)
  end

  defp update_identity(user_identity, additional_params) do
    user_identity
    |> user_identity.__struct__.changeset(additional_params)
    |> Context.do_update(@pow_config)
  end

  defp get_for_user(user, %{"uid" => uid, "provider" => provider}) do
    user_identity = Ecto.build_assoc(user, :user_identities).__struct__

    Cn23.Repo.get_by(user_identity, [user_id: user.user_id, provider: provider, uid: uid])
  end

  defp unique_constraint_error?(errors, field) do
    Enum.find_value(errors, false, fn
      {^field, {_msg, [constraint: :unique, constraint_name: _name]}} -> true
      _any                                                            -> false
    end)
  end

  def create_user(user_identity_params, user_params, user_id_params) do
    pow_assent_create_user(user_identity_params, user_params, user_id_params)
  end

  def delete(user, provider) do
    pow_assent_delete(user, provider)
  end

  def all(user) do
    pow_assent_all(user)
  end
end
