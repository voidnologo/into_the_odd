defmodule IntoTheOddWeb.CharacterHTML do
  use IntoTheOddWeb, :html

  embed_templates "character_html/*"

  attr :name, :string, required: true

  def greet(assigns) do
    ~H"""
    <div class="p-3 bg-parchment border-2 border-gray-700 rounded-sm mb-3 font-special-elite text-gray-900 shadow-sm">
      <h2 class="text-2xl font-bold tracking-wide">
        Greetings, <span class="underline decoration-wavy decoration-gray-600"><%= @name %></span>!
      </h2>
    </div>
    """
  end

  attr :stats, :list, required: true

  def list_stats(assigns) do
    ~H"""
    <div class="p-3 bg-parchment border-2 border-gray-700 rounded-sm mb-3 font-special-elite text-gray-900 shadow-sm">
      <h3 class="text-lg font-bold mb-2 tracking-wide">Stats</h3>
      <table class="w-full border-collapse">
        <tr class="border-b border-gray-600">
          <th class="text-left p-1">Stat</th>
          <th class="text-left p-1">Score</th>
          <th class="text-left p-1">Description</th>
        </tr>
        <%= for stat <- @stats do %>
          <tr>
            <td class="p-1 font-semibold">{stat.label}</td>
            <td class="p-1">{stat.val}</td>
            <td class="p-1 italic tracking-tight">{stat.description}</td>
          </tr>
        <% end %>
      </table>
    </div>
    """
  end

  attr :hp, :integer, required: true

  def hp(assigns) do
    ~H"""
    <div class="p-3 bg-parchment border-2 border-gray-700 rounded-sm mb-3 font-special-elite text-gray-900 shadow-sm">
      <strong class="text-lg font-bold tracking-wide">HP:</strong> <span class="text-lg">{@hp}</span>
    </div>
    """
  end

  attr :arcana, :string, required: true

  def arcana(assigns) do
    ~H"""
    <div class="p-3 bg-parchment border-2 border-gray-700 rounded-sm mb-3 font-special-elite text-gray-900 shadow-sm">
      <h3 class="text-lg font-bold mb-2 tracking-wide">Arcana</h3>
      <p>
        <strong>{@arcana["name"]}:</strong>
        <span class="tracking-tight">{@arcana["description"]}</span>
      </p>
    </div>
    """
  end

  attr :weapons, :list, required: true

  def list_weapons(assigns) do
    ~H"""
    <div class="p-3 bg-parchment border-2 border-gray-700 rounded-sm mb-3 font-special-elite text-gray-900 shadow-sm">
      <h3 class="text-lg font-bold mb-2 tracking-wide">Weapons</h3>
      <table class="w-full border-collapse">
        <tr class="border-b border-gray-600">
          <th class="text-left p-1">Name</th>
          <th class="text-left p-1">Damage</th>
          <th class="text-left p-1">Tags</th>
        </tr>
        <%= for weapon <- @weapons do %>
          <tr>
            <td class="p-1 font-semibold">{weapon["name"]}</td>
            <td class="p-1">{weapon["damage"]}</td>
            <td class="p-1 italic tracking-tight">{weapon["tags"]}</td>
          </tr>
        <% end %>
      </table>
    </div>
    """
  end

  attr :items, :list, required: true

  def list_items(assigns) do
    ~H"""
    <div class="p-3 bg-parchment border-2 border-gray-700 rounded-sm mb-3 font-special-elite text-gray-900 shadow-sm">
      <h3 class="text-lg font-bold mb-2 tracking-wide">Items</h3>
      <div class="flex flex-col gap-1">
        <%= for item <- @items do %>
          <span class="tracking-tight">{item}</span>
        <% end %>
      </div>
    </div>
    """
  end

  attr :traits, :list, required: true

  def list_traits(assigns) do
    ~H"""
    <div class="p-3 bg-parchment border-2 border-gray-700 rounded-sm mb-3 font-special-elite text-gray-900 shadow-sm">
      <h3 class="text-lg font-bold mb-2 tracking-wide">Traits</h3>
      <div class="flex flex-col gap-1">
        <%= for trait <- @traits do %>
          <span class="tracking-tight">{trait}</span>
        <% end %>
      </div>
    </div>
    """
  end
end
