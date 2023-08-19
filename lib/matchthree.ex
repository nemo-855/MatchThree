defmodule Matchthree do
  def main do
    board = Board.initialize(4, 5)

    IO.puts(
      Enum.map(board, fn row ->
        Enum.join(row, " | ") <> "\n"
      end)
      |> Enum.join()
    )
  end
end
