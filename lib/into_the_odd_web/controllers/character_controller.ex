defmodule IntoTheOddWeb.CharacterController do
  use IntoTheOddWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end

  def create(conn, %{"name" => name}) do
    stats = [
      %{
        val: 10,
        label: "Strength",
        description: "Strong"
      },
      %{
        val: 8,
        label: "Dexterity",
        description: "bendy"
      },
      %{
        val: 14,
        label: "Willpower",
        description: "mind"
      }
    ]

    render(conn, :create, name: name, stats: stats)
  end
end
