defmodule Drop do
  @type t :: :red | :blue | :green | :yellow | :purple

  def random_drop do
    Enum.random([:red, :blue, :green, :yellow, :purple])
  end
end