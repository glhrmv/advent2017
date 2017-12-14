defmodule Advent2017.Day04 do
  @input File.read!("inputs/day04.txt")
  
  def input, do: @input
  
  def validate(list) do
    list
    |> Enum.filter(fn passphrase ->
      # Is the passphrase's length the same as the length of 
      # all of its unique elements? If so, it is valid (no duplicates)
      passphrase == Enum.uniq(passphrase)
    end)
  end
  
  def check_for_anagrams(passphrase) do
    # To check for anagrams, sort every passphrase's word
    # so that all possible anagrams are duplicates
    passphrase
    |> Enum.map(&String.split(&1, "", trim: true))
    |> Enum.map(&Enum.sort/1)
  end
end

defmodule Advent2017.Day04.Part1 do
  import Advent2017.Day04
  
  def run do
    input()
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split/1)
    |> validate
    |> Enum.count
    |> IO.inspect
  end
end

defmodule Advent2017.Day04.Part2 do
  import Advent2017.Day04
  
  def run do
    input()
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split/1)
    |> Enum.map(&check_for_anagrams/1)
    |> validate
    |> Enum.count
    |> IO.inspect
  end
end