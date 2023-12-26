defmodule QuickPick.Repo do
  use Ecto.Repo,
    otp_app: :quickPick,
    adapter: Ecto.Adapters.MyXQL
end
