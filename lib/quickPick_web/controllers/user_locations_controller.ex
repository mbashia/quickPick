defmodule QuickPickWeb.UserLocationsController do
  use QuickPickWeb, :controller

  alias QuickPick.UserLocation
  alias QuickPick.UserLocation.UserLocations
  alias QuickPick.Information

  action_fallback QuickPickWeb.FallbackController

  def index(conn, _params) do
    userlocations = UserLocation.list_userlocations()
    render(conn, "index.json", userlocations: userlocations)
  end

  # def create(conn, %{"user_locations" => user_locations_params}) do
  #   with {:ok, %UserLocations{} = user_locations} <- UserLocation.create_user_locations(user_locations_params) do
  #     conn
  #     |> put_status(:created)
  #     |> put_resp_header("location", Routes.user_locations_path(conn, :show, user_locations))
  #     |> render("show.json", user_locations: user_locations)
  #   end
  # end
  def create(conn, params) do
    IO.inspect(params)
    IO.write("params above")
    latitude = Float.to_string(params["latitude"])
    longitude = Float.to_string(params["longitude"])
    user_id = params["user_id"]
    result = Information.get_user_location_record(user_id)
    IO.inspect(result)

    location_params = %{
      "user_id" => user_id,
      "latitude" => latitude,
      "longitude" => longitude,
      "user_type" => params["user_type"]
    }

    case result do
      {:no_record, "no record found"} ->
        with {:ok, %UserLocations{} = location_params} <-
               UserLocation.create_user_locations(location_params) do
          conn
          |> put_status(:created)
          |> put_resp_header("location", Routes.user_locations_path(conn, :show, location_params))
          |> render("show.json", user_locations: location_params)
        end

      {:record_found, user} ->

        with {:ok, %UserLocations{} = location_params} <-
               UserLocation.update_user_locations(user, location_params) do
          conn
          |> put_status(:created)
          |> put_resp_header("location", Routes.user_locations_path(conn, :show, location_params))
          |> render("show.json", user_locations: location_params)
        end
    end


  end

  def show(conn, %{"id" => id}) do
    user_locations = UserLocation.get_user_locations!(id)
    render(conn, "show.json", user_locations: user_locations)
  end

  def update(conn, %{"id" => id, "user_locations" => user_locations_params}) do
    user_locations = UserLocation.get_user_locations!(id)

    with {:ok, %UserLocations{} = user_locations} <-
           UserLocation.update_user_locations(user_locations, user_locations_params) do
      render(conn, "show.json", user_locations: user_locations)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_locations = UserLocation.get_user_locations!(id)

    with {:ok, %UserLocations{}} <- UserLocation.delete_user_locations(user_locations) do
      send_resp(conn, :no_content, "")
    end
  end
end
