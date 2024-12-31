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
      <h3>Stats</h3>
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

  attr :arcana, :string, required: true

  def arcana(assigns) do
    ~H"""
    <div>
      <h3>Arcana</h3>
      <p>{@arcana.name}: {@arcana.description}</p>
    </div>
    """
  end

  attr :weapons, :list, required: true

  def list_weapons(assigns) do
    ~H"""
    <div>
      <h3>Weapons</h3>
      <table>
        <tr>
          <th>Name</th>
          <th>Damage</th>
          <th>Tags</th>
        </tr>
        <%= for weapon <- @weapons do %>
          <tr>
            <td><strong>{weapon.name}</strong></td>
            <td>{weapon.damage}</td>
            <td><em>{weapon.tags}</em></td>
          </tr>
        <% end %>
      </table>
    </div>
    """
  end

  attr :items, :list, required: true

  def list_items(assigns) do
    ~H"""
    <div>
      <h3>Items</h3>
      <%= for item <- @items do %>
        {item}<br />
      <% end %>
    </div>
    """
  end

  attr :traits, :list, required: true

  def list_traits(assigns) do
    ~H"""
    <div>
      <h3>Traits</h3>
      <%= for trait <- @traits do %>
        {trait}<br />
      <% end %>
    </div>
    """
  end
end
