defmodule QuickPick.UserLocation.UserLocations do
  use Ecto.Schema
  import Ecto.Changeset
  alias QuickPick.Accounts.User

  schema "userlocations" do
    field :latitude, :string
    field :longitude, :string
    # field :user_id, :integer
    field :user_type, :string
    belongs_to :user, User, foreign_key: :user_id

    timestamps()
  end

  @doc false
  def changeset(user_locations, attrs) do
    user_locations
    |> cast(attrs, [:user_id, :latitude, :longitude, :user_type])
    |> validate_required([:user_id, :latitude, :longitude, :user_type])
  end
end
