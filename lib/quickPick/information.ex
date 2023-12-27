defmodule QuickPick.Information do
  @moduledoc """
  The Deliveries context.
  """

  import Ecto.Query, warn: false
  alias QuickPick.Repo

  alias QuickPick.Deliveries.Delivery

  @doc """
  Returns the list of deliveries.

  ## Examples

      iex> list_deliveries()
      [%Delivery{}, ...]

  """
  def get_driver_location(current_user)do

  end
  def subscribe() do
    Phoenix.PubSub.subscribe(QuickPick.PubSub, "information")
  end

  def publish(info, tag) do
    Phoenix.PubSub.broadcast(QuickPick.PubSub, "information", {tag, info})

    {:ok, info}
  end
end
