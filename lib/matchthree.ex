defmodule Matchthree do
  def main do
    board = Board.initialize(5, 4)

    IO.puts(
      Enum.map(board, fn row ->
        Enum.join(row, " | ") <> "\n"
      end)
      |> Enum.join()
    )
  end
end
