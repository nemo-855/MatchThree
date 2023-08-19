defmodule MatchthreeTest do
  use ExUnit.Case
  doctest Matchthree

  test "greets the world" do
    assert Matchthree.main() == :world
  end
end
