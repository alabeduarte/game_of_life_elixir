defmodule GameOfLifeTest do
  use ExUnit.Case

  test "returns a dead cell when neighbour has less than two neighbours alive" do
    initial_state = %{0 => %{0 => %AliveCell{neighbours: 0}, 1 => %DeadCell{}}}

    assert GameOfLife.pass_generation(initial_state) == %{
             0 => %{0 => %DeadCell{}, 1 => %DeadCell{}}
           }
  end

  test "returns a new grid where the middle will live and the rest will die" do
    initial_state = %{
      0 => %{
        0 => %AliveCell{neighbours: 1},
        1 => %AliveCell{neighbours: 2},
        2 => %AliveCell{neighbours: 1}
      }
    }

    assert GameOfLife.pass_generation(initial_state) == %{
             0 => %{0 => %DeadCell{}, 1 => %AliveCell{neighbours: 1}, 2 => %DeadCell{}}
           }
  end

  test "returns a new grid  with multiple rows where the middle will live and the rest will die" do
    initial_state = %{
      0 => %{
        0 => %AliveCell{neighbours: 1},
        1 => %AliveCell{neighbours: 2},
        2 => %AliveCell{neighbours: 1}
      },
      1 => %{
        0 => %AliveCell{neighbours: 1},
        1 => %AliveCell{neighbours: 1},
        2 => %DeadCell{}
      }
    }

    assert GameOfLife.pass_generation(initial_state) == %{
             0 => %{0 => %DeadCell{}, 1 => %AliveCell{neighbours: 1}, 2 => %DeadCell{}},
             1 => %{0 => %DeadCell{}, 1 => %DeadCell{}, 2 => %DeadCell{}}
           }
  end
end
