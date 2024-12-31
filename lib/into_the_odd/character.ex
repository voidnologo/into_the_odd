defmodule IntoTheOdd.Character do
  alias IntoTheOdd.Arcana
  alias IntoTheOdd.StartingPackage
  alias IntoTheOdd.Weapon

  @enforce_keys [:name]
  defstruct [:name, :stats, :hp, :arcana, :weapons, :traits, :items]

  def new(name) do
    stats = generate_stats()
    hp = roll_hp()

    high_stat = get_highest_stat(stats)
    starting_package = StartingPackage.get_starting_package(high_stat.val, hp)
    weapons = parse_weapons(starting_package["weapons"])

    arcana =
      if starting_package["arcana"] do
        Arcana.get_arcana()
      else
        nil
      end

    %__MODULE__{
      name: name,
      arcana: arcana,
      hp: hp,
      items: starting_package["items"],
      stats: stats,
      traits: starting_package["traits"],
      weapons: weapons
    }
  end

  def generate_stats do
    [
      %{
        val: roll_stat(),
        label: "Strength",
        description: "Fighting, fortitude, and toughness."
      },
      %{
        val: roll_stat(),
        label: "Dexterity",
        description: "Grace, athletics, and reflexes."
      },
      %{
        val: roll_stat(),
        label: "Willpower",
        description: "Confidence, discipline, and charisma."
      }
    ]
  end

  defp roll_stat do
    Enum.random(3..18)
  end

  defp roll_hp do
    Enum.random(1..6)
  end

  def get_highest_stat(stats) do
    Enum.max_by(stats, & &1.val)
  end

  def parse_weapons(weapons) do
    Enum.map(weapons, &Weapon.get_weapon(&1))
  end
end
