defmodule QuickPickWeb.DriverLive.Index do
  use QuickPickWeb, :live_view

  alias QuickPick.Deliveries
  alias QuickPick.Deliveries.Delivery

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:title, "heeyy")
  end
end
