defmodule Turn do
  defmodule Action do
    @type t :: :up | :down | :left | :right | :execute | :quit | :inputing
  end
end