defmodule Board do
  @type t:: list(list(Orb.t()))

  def initialize(row, column) when row > 0 and column > 0 do
    Enum.map(1..row, fn _ ->
      Enum.map(1..column, fn _ ->
        Drop.random_drop()
      end)
    end)
  end
end
