defmodule IntoTheOdd.Weapon do
  alias IntoTheOdd.Utils

  @data_file "data/weapons.json"

  defp load_data do
    Utils.get_json(@data_file)
  end

  def get_weapon(name) do
    {:ok, weapons} = load_data()
    weapons[name]
  end
end
