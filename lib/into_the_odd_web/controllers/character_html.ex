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
      <table>
        <tr>
          <th>Stat</th>
          <th>Score</th>
          <th>Description</th>
        </tr>
        <%= for stat <- @stats do %>
          <tr>
            <td><strong>{stat.label}</strong></td>
            <td>{stat.val}</td>
            <td><em>{stat.description}</em></td>
          </tr>
        <% end %>
      </table>
    </div>
    """
  end

  attr :hp, :integer, required: true

  def hp(assigns) do
    ~H"""
    <div>
      <strong>HP:</strong> {@hp}
    </div>
    """
  end
end
