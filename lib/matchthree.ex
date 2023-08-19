defmodule MatchThree do
  use Application

  def start(_type, _args) do
    board = Board.initialize(4, 5)
    atom = listen_for_key_press()
    IO.puts "Success #{atom}"

    {:ok, self()}
  end

  @doc """
  キー入力を受け取る。標準入力を扱うため純粋関数ではない。
  """
  defp listen_for_key_press do
    key_press = IO.getn(1)
    case Input.convert(key_press) do
      :inputing -> listen_for_key_press()
      result -> result
    end
  end
end

