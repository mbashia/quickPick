defmodule QuickPick.DeliveriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `QuickPick.Deliveries` context.
  """

  @doc """
  Generate a delivery.
  """
  def delivery_fixture(attrs \\ %{}) do
    {:ok, delivery} =
      attrs
      |> Enum.into(%{
        customer_name: "some customer_name",
        customer_phone: "some customer_phone",
        description: "some description",
        from: "some from",
        lats: "some lats",
        long: "some long",
        price: "some price",
        status: "some status",
        to: "some to"
      })
      |> QuickPick.Deliveries.create_delivery()

    delivery
  end
end
