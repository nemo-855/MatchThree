defmodule MatchThree do
  use Application

  def start(_type, _args) do
    Board.initialize(4, 5) |> Output.print_board()

    atom = Input.listen_for_key_press()
    IO.puts "Success #{atom}"

    {:ok, self()}
  end
end
