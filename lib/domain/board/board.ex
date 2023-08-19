defmodule Board do
  defstruct content: [], selected_cell: {0, 0}

  @type t :: %Board{
          content: list(list(Drop.t())),
          selected_cell: {integer(), integer()}
        }

  @spec initialize(non_neg_integer(), non_neg_integer()) :: t()
  def initialize(column, row) when column > 0 and row > 0 do
    new_board_content = Enum.map(1..column, fn _ ->
      Enum.map(1..row, fn _ ->
        Drop.random_drop()
      end)
    end)

    %Board{
      content: new_board_content,
      selected_cell: {0, 0}
    }
  end
end
