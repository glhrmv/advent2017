defmodule Advent2017.Day01 do
  @input File.read!("inputs/day01.txt")
  
  def run do
    @input
    |> String.split("", trim: true)
    |> put_first_in_last
    |> IO.inspect
  end
  
  def put_first_in_last(list) do
    list ++ Enum.take(list, 1)
    |> Enum.drop(1)
  end
end