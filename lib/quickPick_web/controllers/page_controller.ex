defmodule QuickPickWeb.PageController do
  use QuickPickWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
