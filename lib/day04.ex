defmodule Advent2017.Day04 do
  @input File.read!("inputs/day04.txt")
  
  def input do
    @input
  end
  
  def validate(list_of_passphrases) do
    list_of_passphrases
    |> Enum.map(&String.split/1) # Split each passphrase into a list of words
    |> Enum.filter(fn p ->
      # Is the passphrase's length the same as the length of 
      # all of its unique elements? If so, it is valid (no duplicates)
      length(p) == length(Enum.uniq(p))
    end)
  end
end

defmodule Advent2017.Day04.Part1 do
  import Advent2017.Day04
  
  def run do
    input()
    |> String.split("\n", trim: true)
    |> validate
    |> Enum.count
    |> IO.inspect
  end
end