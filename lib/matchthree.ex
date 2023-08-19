defmodule MatchThree do
  use Application

  def start(_type, _args) do
    Input.SelectingDrop.listen_key_press_for_selecting_drop()
    |> Board.initialize()
    |> Output.print_board()

    {:ok, self()}
  end
end
