defmodule Input do
  defmodule SelectingDrop do
    @doc """
    ドロップ選択のためキー入力を受け取る。標準入力を扱うため純粋関数ではない。
    """
    @spec listen_key_press_for_selecting_drop() :: {integer(), integer()}
    def listen_key_press_for_selecting_drop do
      x_input = prompt_input_until_valid("Enter x: ")
      y_input = prompt_input_until_valid("Enter y: ")

      {x_input, y_input}
    end

    # 標準入力を扱うため純粋関数ではない。
    @spec prompt_input_until_valid(String.t()) :: integer()
    defp prompt_input_until_valid(prompt) do
      IO.puts(prompt)
      input = IO.getn(1) |> String.trim()

      if is_integer_string?(input) do
        input |> String.to_integer()
      else
        prompt_input_until_valid(prompt)
      end
    end

    @spec is_integer_string?(String.t()) :: boolean()
    defp is_integer_string?(s) do
      case Integer.parse(s) do
        {_, ""} -> true
        _ -> false
      end
    end
  end

  defmodule MovingDrop do
    @doc """
    ドロップ移動のためキー入力を受け取る。標準入力を扱うため純粋関数ではない。
    """
    @spec listen_key_press_for_moving_drop() :: Turn.Action.t
    def listen_key_press_for_moving_drop do
      key_press = IO.getn(1)
      case convert_key_to_action(key_press) do
        :inputing -> listen_key_press_for_moving_drop()
        result -> result
      end
    end

    @spec convert_key_to_action(String.t()) :: Turn.Action.t()
    defp convert_key_to_action(key_press) do
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
end
