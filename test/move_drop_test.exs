defmodule MoveDropTest do
  use ExUnit.Case

  test "Passing a 5*4 board, (0, 0), :right, returns a board that swapped successfully" do
    fakeBoard =
      Enum.map(0..3, fn y ->
        Enum.map(0..4, fn x ->
          case {x, y} do
            {0, 0} -> :blue
            _ -> :red
          end
        end)
      end)

    actual = MoveDrop.execute(fakeBoard, {0, 0}, :right)

    expected =
      Enum.map(0..3, fn y ->
        Enum.map(0..4, fn x ->
          case {x, y} do
            {1, 0} -> :blue
            _ -> :red
          end
        end)
      end)

    assert actual == expected
  end

  test "Passing a 5*4 board, (0, 0), :down, returns a board that swapped successfully" do
    fakeBoard =
      Enum.map(0..3, fn y ->
        Enum.map(0..4, fn x ->
          case {x, y} do
            {0, 0} -> :blue
            _ -> :red
          end
        end)
      end)

    actual = MoveDrop.execute(fakeBoard, {0, 0}, :down)

    expected =
      Enum.map(0..3, fn y ->
        Enum.map(0..4, fn x ->
          case {x, y} do
            {0, 1} -> :blue
            _ -> :red
          end
        end)
      end)

    assert actual == expected
  end

  test "Passing a 5*4 board, (4, 3), :left, returns a board that swapped successfully" do
    fakeBoard =
      Enum.map(0..3, fn y ->
        Enum.map(0..4, fn x ->
          case {x, y} do
            {4, 3} -> :blue
            _ -> :red
          end
        end)
      end)

    actual = MoveDrop.execute(fakeBoard, {4, 3}, :left)

    expected =
      Enum.map(0..3, fn y ->
        Enum.map(0..4, fn x ->
          case {x, y} do
            {3, 3} -> :blue
            _ -> :red
          end
        end)
      end)

    assert actual == expected
  end

  test "Passing a 5*4 board, (4, 3), :up, returns a board that swapped successfully" do
    fakeBoard =
      Enum.map(0..3, fn y ->
        Enum.map(0..4, fn x ->
          case {x, y} do
            {4, 3} -> :blue
            _ -> :red
          end
        end)
      end)

    actual = MoveDrop.execute(fakeBoard, {4, 3}, :up)

    expected =
      Enum.map(0..3, fn y ->
        Enum.map(0..4, fn x ->
          case {x, y} do
            {4, 2} -> :blue
            _ -> :red
          end
        end)
      end)

    assert actual == expected
  end

  test "Passing a 5*4 board, (4, 3), :right, returns given board" do
    fakeBoard =
      Enum.map(0..3, fn y ->
        Enum.map(0..4, fn x ->
          case {x, y} do
            {4, 3} -> :blue
            _ -> :red
          end
        end)
      end)

    actual = MoveDrop.execute(fakeBoard, {4, 3}, :right)

    assert actual == fakeBoard
  end

  test "Passing a 5*4 board, (4, 3), :down, returns given board" do
    fakeBoard =
      Enum.map(0..3, fn y ->
        Enum.map(0..4, fn x ->
          case {x, y} do
            {4, 3} -> :blue
            _ -> :red
          end
        end)
      end)

    actual = MoveDrop.execute(fakeBoard, {4, 3}, :down)

    assert actual == fakeBoard
  end

  test "Passing a 5*4 board, (0, 0), :left, returns given board" do
    fakeBoard =
      Enum.map(0..3, fn y ->
        Enum.map(0..4, fn x ->
          case {x, y} do
            {0, 0} -> :blue
            _ -> :red
          end
        end)
      end)

    actual = MoveDrop.execute(fakeBoard, {0, 0}, :left)

    assert actual == fakeBoard
  end

  test "Passing a 5*4 board, (0, 0), :up, returns given board" do
    fakeBoard =
      Enum.map(0..3, fn y ->
        Enum.map(0..4, fn x ->
          case {x, y} do
            {0, 0} -> :blue
            _ -> :red
          end
        end)
      end)

    actual = MoveDrop.execute(fakeBoard, {0, 0}, :up)

    assert actual == fakeBoard
  end
end
