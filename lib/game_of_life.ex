defmodule AliveCell do
  defstruct neighbours: 0
end

defmodule DeadCell do
  defstruct neighbours: 0
end

defmodule GameOfLife do
  def pass_generation(generation) do
    generation
    |> Enum.map(fn {key, value} -> {key, new_generation(value)} end)
    |> Enum.reduce(%{}, fn {k, v}, acc -> Map.put(acc, k, v) end)
  end

  defp new_generation(row) do
    row
    |> Enum.map(fn {key, cell} -> {key, state_of_life(cell)} end)
    |> Enum.reduce(%{}, fn {k, v}, acc -> Map.put(acc, k, v) end)
  end

  defp state_of_life(%{neighbours: 0}), do: %DeadCell{}
  defp state_of_life(%{neighbours: 1}), do: %DeadCell{}
  defp state_of_life(cell), do: %AliveCell{neighbours: cell.neighbours - 1}
end
