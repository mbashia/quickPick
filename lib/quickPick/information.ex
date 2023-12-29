defmodule QuickPick.Information do
  @moduledoc """
  The Deliveries context.
  """

  import Ecto.Query, warn: false
  alias QuickPick.Repo

  alias QuickPick.Deliveries.Delivery
  alias QuickPick.UserLocation.UserLocations

  @doc """
  Returns the list of deliveries.

  ## Examples

      iex> list_deliveries()
      [%Delivery{}, ...]

  """
  def get_driver_location(current_user) do
  end

  def subscribe() do
    Phoenix.PubSub.subscribe(QuickPick.PubSub, "information")
  end

  def publish(info, tag) do
    Phoenix.PubSub.broadcast(QuickPick.PubSub, "information", {tag, info})

    {:ok, info}
  end

  def get_user_location_record(user_id) do
    results = Repo.one(from(l in UserLocations, where: l.user_id == ^user_id))
    IO.inspect(results)

    case results do
      nil ->
        {:no_record, "no record found"}

     user ->
        {:record_found, user}
    end
  end
end
