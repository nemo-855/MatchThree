defmodule MatchThree do
  use Application

  def start(_type, _args) do
    initial_board = Board.initialize()

    Output.print_board(initial_board)

    drop_selected_board = initial_board
    |> Board.select_drop()
    |> (& &1.(Input.SelectingDrop.listen_key_press_for_selecting_drop())).()

    Output.print_board(drop_selected_board)

    direction = Input.MovingDrop.listen_key_press_for_moving_drop()
    new_board = MoveDrop.execute(drop_selected_board, direction)

    Output.print_board(new_board)

    {:ok, self()}
  end
end
