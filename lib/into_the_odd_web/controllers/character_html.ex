defmodule IntoTheOddWeb.CharacterHTML do
  use IntoTheOddWeb, :html

  embed_templates "character_html/*"

  attr :name, :string, required: true

  def greet(assigns) do
    ~H"""
    <h2>Hello <strong>{@name}</strong>!</h2>
    """
  end

  attr :stats, :list, required: true

  def list_stats(assigns) do
    ~H"""
    <div>
      <ul>
        <li :for={stat <- @stats}>
          <strong>{stat.label}:</strong> {stat.val} - <em>{stat.description}</em>
        </li>
      </ul>
    </div>
    """
  end
end
