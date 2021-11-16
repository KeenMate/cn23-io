defmodule Cn23.UserContext do
  @moduledoc """
  Contains methods for creating and manipulating UserContext
  """

  @enforce_keys [
    :name,
    :id
  ]

  defstruct [
    :name,
    :id
  ]

  @typedoc """
  UserContext represents the user performing operations against the system. It is used mainly for logging purposes
  """
  @type t :: %__MODULE__{name: String.t(), id: non_neg_integer()}

  @doc """
  Creates user context from username
  """
  def create(username, user_id) do
    %__MODULE__{name: username, id: user_id}
  end

  @doc """
  Creates a system user context, representing the Octoro application itself.
  """
  def system() do
    %__MODULE__{name: "SYSTEM", id: 0}
  end

  @doc """
  Creates an unknown users' context for when there is no authenticated user performing operations against the system.
  """
  def unknown() do
    %__MODULE__{name: "UNKNOWN", id: 0}
  end

  def demo() do
    %__MODULE__{name: "albert.moravec@keenmate.com", id: 2}
  end
end
