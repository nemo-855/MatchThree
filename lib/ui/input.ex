defmodule Input do
  @doc """
  キー入力を受け取る。標準入力を扱うため純粋関数ではない。
  """
  def listen_for_key_press do
    key_press = IO.getn(1)
    case Input.convert(key_press) do
      :inputing -> listen_for_key_press()
      result -> result
    end
  end

  @spec convert(String.t) :: Turn.Action.t
  defp convert(key_press) do
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

