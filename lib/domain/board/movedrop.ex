defmodule MoveDrop do
  @type direction :: :up | :down | :left | :right

  @doc """
  ドロップの移動先を確認して、指定された方向にドロップを移動する

  移動先にドロップが存在する場合、指定されたドロップと入れ替えたボードを返す
  移動先にドロップが存在しない場合、与えられたボードをそのまま返す
  """
  @spec execute(Board.t(), MoveDrop.direction()) :: Board.t()
  def execute(board, direction) do
    case get_next_position(board, direction) do
      {next_x, next_y} -> swap(board, {next_x, next_y})
      _ -> board
    end
  end

  @spec get_next_position(Board.t(), MoveDrop.direction()) :: {integer, integer}
  defp get_next_position(%Board{content: content, selected_drop: {x, y}}, direction) do
    case direction do
      :up ->
        {x, Enum.max([y - 1, 0])}
      :down ->
        {x, Enum.min([y + 1, length(content) - 1])}
      :left ->
        {Enum.max([x - 1, 0]), y}
      :right ->
        {Enum.min([x + 1, length(Enum.at(content, 0)) - 1]), y}
    end
  end

  @spec swap(Board.t(), {integer, integer}) :: Board.t()
  defp swap(%Board{content: content, selected_drop: {x1, y1}}, {x2, y2}) do
    new_content = Enum.with_index(content) |> Enum.map(fn {columns, y} ->
      Enum.with_index(columns) |> Enum.map(fn {drop, x} ->
        case {x, y} do
          {^x1, ^y1} -> Enum.at(Enum.at(content, y2), x2)
          {^x2, ^y2} -> Enum.at(Enum.at(content, y1), x1)
          _ -> drop
        end
      end)
    end)

    %Board{content: new_content, selected_drop: {x2, y2}}
  end
end