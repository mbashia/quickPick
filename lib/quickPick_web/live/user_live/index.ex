defmodule QuickPickWeb.UserLive.Index do
  use QuickPickWeb, :live_view

  alias QuickPick.Deliveries
  alias QuickPick.Deliveries.Delivery
  alias QuickPick.Accounts

  @impl true
  def mount(_params, session, socket) do
    user = Accounts.get_user_by_session_token(session["user_token"])
    IO.inspect(user)
    {:ok,
     socket
     |>assign(:user_id,user.id)
     |>assign(:user_type, user.role)

     }
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
