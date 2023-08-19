defmodule Board do
  defstruct content: [], selected_cell: {0, 0}

  @type t :: %Board{
          content: list(list(Drop.t())),
          selected_cell: {integer(), integer()}
        }

  @spec initialize({integer, integer}) :: Board.t()
  def initialize({selected_x, selected_y}) do
    {column_size, row_size} = get_board_size()

    new_board = %Board{
      content:
        Enum.map(1..column_size, fn _ ->
          Enum.map(1..row_size, fn _ ->
            Drop.random_drop()
          end)
        end),
      selected_cell: {0, 0}
    }

    if exist_position?(new_board, {selected_x, selected_y}) do
      %Board{new_board | selected_cell: {selected_x, selected_y}}
    else
      new_board
    end
  end

  @spec select_drop(Board.t()) :: (tuple() -> Board.t())
  def select_drop(board) do
    fn
      {new_x, new_y} ->
      if exist_position?(board, {new_x, new_y}) do
        %Board{board | selected_cell: {new_x, new_y}}
      else
        board
      end
    end
  end


  @spec get_board_size() :: {integer, integer}
  defp get_board_size do
    {5, 5}
  end

  @spec exist_position?(Board.t(), {integer, integer}) :: boolean()
  defp exist_position?(%Board{content: content}, {x, y}) do
    x >= 0 and y >= 0 and x < length(Enum.at(content, 0)) and y < length(content)
  end
end
