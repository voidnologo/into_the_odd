defmodule IntoTheOdd.Arcana do
  alias IntoTheOdd.Utils


  @data_file "data/arcana.json"

  def load_data do
    {:ok, data} <- Utils.get_json(@data_file),
  end
end
