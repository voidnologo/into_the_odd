defmodule IntoTheOddWeb.CharacterController do
  alias IntoTheOdd.Character
  use IntoTheOddWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end

  def create(conn, %{"name" => name}) do
    character = Character.new(name)
    render(conn, :create, character: character)
  end
end
