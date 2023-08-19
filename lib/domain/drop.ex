defmodule Drop do
  @type t :: :red | :blue | :green | :yellow

  def random_drop do
    Enum.random([:red, :blue, :green, :yellow])
  end
end