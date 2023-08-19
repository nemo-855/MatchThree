defmodule Output do
  @doc """
  [Board.t]と現在選択されているドロップの座標を受け取り、コンソールに出力する。
  標準出力を扱うため純粋関数ではない。
  """
  @spec print_board(Board.t()) :: :ok
  def print_board(%Board{content: content, selected_cell: {selected_x, selected_y}}) do
    Enum.with_index(content)
    |> Enum.map(fn {row, y_index} ->
      Enum.with_index(row)
      |> Enum.map(fn {drop, x_index} ->
        print_drop(
          drop,
          x_index == selected_x and y_index == selected_y
        )
      end)
      |> Enum.join("")
    end)
    |> Enum.join("\n")
    |> IO.puts()
  end

  @spec print_drop(Drop.t(), boolean()) :: String.t()
  defp print_drop(drop, is_selected) do
    case drop do
      :red -> if is_selected, do: "[🔴]", else: " 🔴 "
      :blue -> if is_selected, do: "[🔵]", else: " 🔵 "
      :green -> if is_selected, do: "[🟢]", else: " 🟢 "
      :yellow -> if is_selected, do: "[🟡]", else: " 🟡 "
    end
  end
end
