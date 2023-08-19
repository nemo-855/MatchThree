defmodule Output do
  @doc """
  [Board.t]を受け取り、コンソールに出力する。標準出力を扱うため純粋関数ではない。
  """
  @spec print_board(Board.t()) :: :ok
  def print_board(board) do
    board
    |> Enum.map(fn row ->
      row
      |> Enum.map(fn drop ->
        drop
        |> print_drop()
      end)
    end)
    |> Enum.join("\n")
    |> IO.puts()
  end

  @doc """
  [Drop.t]を受け取り、対応するドロップを返す。
  """
  defp print_drop(drop) do
    case drop do
      :red -> "🔴"
      :blue -> "🔵"
      :green -> "🟢"
      :yellow -> "🟡"
    end
  end
end
