defmodule Drop do
  @type t :: :red | :blue | :green

  def random_drop do
    Enum.random([:red, :blue, :green])
  end
end