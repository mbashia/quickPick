defmodule QuickPick.Deliveries.Delivery do
  use Ecto.Schema
  import Ecto.Changeset

  schema "deliveries" do
    field :customer_name, :string
    field :customer_phone, :string
    field :description, :string
    field :from, :string
    field :lats, :string
    field :long, :string
    field :price, :string
    field :status, :string
    field :to, :string

    timestamps()
  end

  @doc false
  def changeset(delivery, attrs) do
    delivery
    |> cast(attrs, [
      :from,
      :to,
      :price,
      :lats,
      :long,
      :customer_name,
      :customer_phone,
      :description,
      :status
    ])
    |> validate_required([
      :from,
      :to,
      :price,
      :lats,
      :long,
      :customer_name,
      :customer_phone,
      :description,
      :status
    ])
  end
end
