defmodule QuickPick.UserLocation do
  @moduledoc """
  The UserLocation context.
  """

  import Ecto.Query, warn: false
  alias QuickPick.Repo

  alias QuickPick.UserLocation.UserLocations

  @doc """
  Returns the list of userlocations.

  ## Examples

      iex> list_userlocations()
      [%UserLocations{}, ...]

  """
  def list_userlocations do
    Repo.all(UserLocations)
  end

  @doc """
  Gets a single user_locations.

  Raises `Ecto.NoResultsError` if the User locations does not exist.

  ## Examples

      iex> get_user_locations!(123)
      %UserLocations{}

      iex> get_user_locations!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_locations!(id), do: Repo.get!(UserLocations, id)

  @doc """
  Creates a user_locations.

  ## Examples

      iex> create_user_locations(%{field: value})
      {:ok, %UserLocations{}}

      iex> create_user_locations(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_locations(attrs \\ %{}) do
    %UserLocations{}
    |> UserLocations.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_locations.

  ## Examples

      iex> update_user_locations(user_locations, %{field: new_value})
      {:ok, %UserLocations{}}

      iex> update_user_locations(user_locations, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_locations(%UserLocations{} = user_locations, attrs) do
    user_locations
    |> UserLocations.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_locations.

  ## Examples

      iex> delete_user_locations(user_locations)
      {:ok, %UserLocations{}}

      iex> delete_user_locations(user_locations)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_locations(%UserLocations{} = user_locations) do
    Repo.delete(user_locations)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_locations changes.

  ## Examples

      iex> change_user_locations(user_locations)
      %Ecto.Changeset{data: %UserLocations{}}

  """
  def change_user_locations(%UserLocations{} = user_locations, attrs \\ %{}) do
    UserLocations.changeset(user_locations, attrs)
  end
end
