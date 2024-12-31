defmodule IntoTheOdd.StartingPackage do
  alias IntoTheOdd.Utils

  @data_file "data/starting.json"

  defp load_data do
    Utils.get_json(@data_file)
  end

  def get_starting_package(high_stat, hp) do
    {:ok, packages} = load_data()

    high_stat =
      if high_stat < 9 do
        9
      else
        high_stat
      end

    packages[to_string(high_stat)][to_string(hp)]
  end
end
