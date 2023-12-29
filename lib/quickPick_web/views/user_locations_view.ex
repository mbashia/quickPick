defmodule QuickPickWeb.UserLocationsView do
  use QuickPickWeb, :view
  alias QuickPickWeb.UserLocationsView

  def render("index.json", %{userlocations: userlocations}) do
    %{data: render_many(userlocations, UserLocationsView, "user_locations.json")}
  end

  def render("show.json", %{user_locations: user_locations}) do
    %{data: render_one(user_locations, UserLocationsView, "user_locations.json")}
  end

  def render("user_locations.json", %{user_locations: user_locations}) do
    %{
      id: user_locations.id,
      user_id: user_locations.user_id,
      latitude: user_locations.latitude,
      longitude: user_locations.longitude,
      user_type: user_locations.user_type
    }
  end
end
