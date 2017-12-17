defmodule Advent2017.Day16 do
  @input File.read!("inputs/day16.txt")
  
  @starting_dance "abcdefghijklmnop"

  def input, do: @input
  def starting_dance, do: @starting_dance |> String.split("", trim: true)

  def parse_move(move) do
    {op, argstr} = String.split_at(move, 1)
    
    args = String.split(argstr, "/", trim: true)

    case op do
      "s" -> %{op: :spin, args: Enum.map(args, &String.to_integer/1)}
      "x" -> %{op: :exchange, args: Enum.map(args, &String.to_integer/1)}
      "p" -> %{op: :partner, args: args}
    end
  end
  
  def process_dance(%{op: op, args: args}, programs) do
    case op do
      :spin -> spin(programs, args)
      :exchange -> exchange(programs, args)
      :partner -> partner(programs, args)
      
      _ -> :error
    end
  end
  
  def spin(programs, [spin_value]) do
    {split_start, split_end} = String.split_at(programs, 0 - spin_value)
    
    split_end <> split_start
  end
  
  def exchange(programs, [_pos_a, _pos_b] = args) do
    # Instead of exchanging on an index-basis, get the
    # respective letter and call the partner function
    args = args |> Enum.sort |> Enum.map(&String.at(programs, &1))
    
    partner(programs, args)
  end
  
  def partner(programs, [program_a, program_b]) do
    partner(String.graphemes(programs), program_a, program_b)
  end
  
  def partner(lst, a, b, acc \\ [])
  def partner([h|tl], a, b, acc) when h == a do
    partner(tl, a, b, [b|acc])
  end
  def partner([h|tl], a, b, acc) when h == b do
    partner(tl, a, b, [a|acc])
  end
  def partner([h|tl], a,b, acc) do
    partner(tl, a, b, [h|acc])
  end
  def partner([], _, _, acc) do
    Enum.reverse(acc)
    |> Enum.join
  end
  
  def dance(list) do
    list
    |> Enum.map(&parse_move/1)
    |> Enum.reduce(@starting_dance, &process_dance/2)
  end
end

defmodule Advent2017.Day16.Part1 do
  import Advent2017.Day16
  
  def run do
    input()
    |> String.split(",", trim: true)
    |> dance
    |> IO.inspect
  end
end