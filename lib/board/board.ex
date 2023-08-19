defmodule Board do
  @type t:: list(list(Drop.t()))

  @spec initialize(non_neg_integer(), non_neg_integer()) :: t()
  def initialize(column, row) when column > 0 and row > 0 do
    Enum.map(1..column, fn _ ->
      Enum.map(1..row, fn _ ->
        Drop.random_drop()
      end)
    end)
  end
end
