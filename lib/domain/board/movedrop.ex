defmodule MoveDrop do
  @type direction :: :up | :down | :left | :right

  @doc """
  ドロップの移動先を確認して、指定された方向にドロップを移動する

  移動先にドロップが存在する場合、指定されたドロップと入れ替えたボードを返す
  移動先にドロップが存在しない場合、与えられたボードをそのまま返す
  """
  def execute(board, {x, y}, direction) do
    case get_next_position(board, {x, y}, direction) do
      {next_x, next_y} -> swap(board, {x, y}, {next_x, next_y})
      _ -> board
    end
  end

  defp get_next_position(board, {x, y}, direction) do
    case direction do
      :up ->
        {x, Enum.max([y - 1, 0])}
      :down ->
        {x, Enum.min([y + 1, length(board) - 1])}
      :left ->
        {Enum.max([x - 1, 0]), y}
      :right ->
        {Enum.min([x + 1, length(Enum.at(board, 0)) - 1]), y}
    end
  end

  defp swap(board, {x1, y1}, {x2, y2}) do
    Enum.with_index(board) |> Enum.map(fn {columns, y} ->
      Enum.with_index(columns) |> Enum.map(fn {drop, x} ->
        case {x, y} do
          {^x1, ^y1} -> Enum.at(Enum.at(board, y2), x2)
          {^x2, ^y2} -> Enum.at(Enum.at(board, y1), x1)
          _ -> drop
        end
      end)
    end)
  end
end