defmodule IntoTheOdd.Arcana do
  alias Jason

  def get_json(filename) do
    with {:ok, body} <- File.read(filename),
         {:ok, json} <- Jason.decode(body) do
      {:ok, json}
    end
  end
end
