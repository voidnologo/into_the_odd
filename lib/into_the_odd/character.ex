defmodule IntoTheOdd.Character do
  @enforce_keys [:name]
  defstruct [:name, :stats, :hp]

  def new(name) do
    %__MODULE__{
      name: name,
      stats: generate_stats(),
      hp: roll_hp()
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
end
