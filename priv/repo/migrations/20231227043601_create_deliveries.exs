defmodule QuickPick.Repo.Migrations.CreateDeliveries do
  use Ecto.Migration

  def change do
    create table(:deliveries) do
      add :from, :string
      add :to, :string
      add :price, :string
      add :lats_from, :string
      add :long_from, :string
      add :lats_to, :string
      add :long_to, :string
      add :customer_name, :string
      add :customer_phone, :string
      add :description, :string
      add :status, :string

      timestamps()
    end
  end
end
