defmodule QuickPickWeb.UserLive.Index do
  use QuickPickWeb, :live_view

  alias QuickPick.Deliveries
  alias QuickPick.Deliveries.Delivery

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:lats_from, "-1.0387569")
     |> assign(:lats_to, "-1.0387569")
     |> assign(:long_from, "37.0833753")
     |> assign(:long_to, "37.0833753")}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  def handle_event("validate", params, socket) do
    IO.inspect(params)

    {:noreply,
     socket
     |> assign(:lats_from, params["lats_from"])
     |> assign(:lats_to, params["lats_to"])
     |> assign(:long_from, params["long_from"])
     |> assign(:long_to, params["long_to"])}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:title, "heeyy")
  end
end
