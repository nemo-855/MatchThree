defmodule MatchThree do
  use Application

  def start(_type, _args) do
    initial_board = Board.initialize()

    Output.print_board(initial_board)

    drop_selected_board = initial_board
    |> Board.select_drop()
    |> (& &1.(Input.SelectingDrop.listen_key_press_for_selecting_drop())).()

    Output.print_board(drop_selected_board)

    move_drop_continuously(drop_selected_board)

    {:ok, self()}
  end

  @doc """
  ドロップ移動のためキー入力を受け取る。標準入力を扱うため純粋関数ではない。
  """
  defp move_drop_continuously(current_board) do
    direction = Input.MovingDrop.listen_key_press_for_moving_drop()
    new_board = MoveDrop.execute(current_board, direction)

    Output.print_board(new_board)

    move_drop_continuously(new_board)
  end
end
