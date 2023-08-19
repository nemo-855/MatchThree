defmodule Input do
  @doc """
  キー入力を受け取り、対応する[Turn.Action.t]に変換する
  """
  @spec convert(String.t) :: Turn.Action.t
  def convert(key_press) do
    case key_press do
      "h" -> :left
      "j" -> :down
      "k" -> :up
      "l" -> :right
      "q" -> :quit
      " " -> :execute
      _other -> :inputing
    end
  end
end

