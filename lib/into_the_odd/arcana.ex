defmodule IntoTheOdd.Arcana do
  alias IntoTheOdd.Utils

  @data_file "data/arcana.json"

  defp load_data do
    Utils.get_json(@data_file)
  end

  def get_arcana do
    {:ok, arcana} = load_data()
    Enum.random(arcana)
  end
end
