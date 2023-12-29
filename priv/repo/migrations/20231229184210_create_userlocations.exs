defmodule QuickPick.Repo.Migrations.CreateUserlocations do
  use Ecto.Migration

  def change do
    create table(:userlocations) do
      add :user_id, :integer
      add :latitude, :string
      add :longitude, :string
      add :user_type, :string

      timestamps()
    end
  end
end
