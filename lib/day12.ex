defmodule Advent2017.Day12 do
  @input File.read!("inputs/day12.txt")
  
  def input, do: @input
  
  def parse_line(line) do
    [program, "<->" | rest] = String.split(line)
    
    connections = 
      rest
      |> Enum.map(&(String.trim(&1, ",")))
      |> Enum.map(&String.to_integer/1)
      
    # Parse each input line as
    # {program, list_of_connections}
    # Ex: {0, [1, 2, 3]}
    {String.to_integer(program), connections}
  end
  
  def add_leaves([curr | rest], main, connections) do
    nconns = Map.update(connections, curr, MapSet.new, &(MapSet.put(&1, main)))
    
    add_leaves(rest, main, nconns)
  end
  def add_leaves([], _main, connections), do: connections
  
  def get_connections(lst, connections \\ %{})
  def get_connections([curr | rest], connections) do
   {main, leaves} = curr
   
   nconns = Map.update(connections, main, MapSet.new, fn(x) -> 
     MapSet.union(x, MapSet.new(leaves))
   end)
   
   full_connections = add_leaves(leaves, main, nconns)
   get_connections(rest, full_connections)
  end
  def get_connections([], connections), do: connections
  
  def find_all(graph, start, seen \\ MapSet.new)
  def find_all(graph, start, seen) do
    new_members = Map.fetch!(graph, start)
                  |> MapSet.to_list
                  |> Enum.filter(&(not MapSet.member?(seen, &1)))
    
    if new_members == [] do
      seen
    else
      nseen = MapSet.union(seen, MapSet.new(new_members))
      
      new_members
      |> Enum.map(&(find_all(graph, &1, nseen)))
      |> Enum.reduce(seen, &(MapSet.union(&1, &2)))
    end
  end

  def find_group(graph, start) do
    find_all(graph, start)
    |> MapSet.to_list
  end

  def count_groups(nodes, graph, count \\ 0) 
  def count_groups([curr | rest], graph, count) do
    curr_group = find_group(graph, curr)
    
    nrest = Enum.reduce(curr_group, rest, fn(x, acc) -> 
      List.delete(acc, x) 
    end)
    
    count_groups(nrest, graph, count + 1)
  end
  def count_groups([], _graph, count), do: count
end

defmodule Advent2017.Day12.Part1 do
  import Advent2017.Day12
  
  def run do
    input()
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
    |> get_connections
    |> find_group(0)
    |> Enum.count
    |> IO.inspect
  end
end
