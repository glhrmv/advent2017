defmodule Advent2017.Day07 do
  @input File.read!("inputs/day07.txt")
  
  def input, do: @input
  
  def parse_program(program) do
    # Parse each program line, example:
    # emlzcpy (106) -> pwmoihf, sdwnkb
    [n, w | above ] = Regex.split(~r{(\s+|\s*->\s*|,\s*)}, program, trim: true)
    [w] = Regex.run(~r{\d+}, w)

    # Return a tuple with 
    # the name of each program,
    # its weight, and dependencies
    {n, String.to_integer(w), above}
  end
  
  def build_tower(_list, _tower \\ %{})
  def build_tower([curr | rest], tower) do
    build_tower(rest, add_program(curr, tower))
  end
  def build_tower([], tower), do: tower
  
  def add_program({name, weight, []}, tower) do
    # If the program has no others
    # above it, just add it as normal
    add_program({name, weight}, tower)
  end
  
  def add_program({name, weight}, tower) do
    if tower[name] do
      put_in(tower, [name, :weight], weight)
    else
      put_in(tower, [name], %{ weight: weight, above: [], below: [] })
    end
  end
  
  def add_program({name, weight, above}, tower) do
    add_program({name, weight}, tower)
    |> put_in([name, :above], above)
    |> (&Enum.reduce(above, &1, fn(above_name, tower) ->
      new_tower =
        unless tower[above_name] do
          add_program({above_name, nil}, tower)
        else
          tower
        end

      put_in(new_tower, [above_name, :below], new_tower[above_name][:below] ++ [name])
    end)).()
  end
  
  def find_bottom(tower) do
    tower
    |> IO.inspect
    |> Enum.reduce(nil, fn {name, details}, below ->
      if below do
        below
      else
        if Enum.empty?(details[:below]), do: name, else: nil
      end
    end)
  end
  
  def process(list) do
    list
    |> Enum.map(&parse_program/1)
    |> build_tower
    |> find_bottom
  end
end

defmodule Advent2017.Day07.Part1 do
  import Advent2017.Day07
  
  def run do
    input()
    |> String.split("\n", trim: true)
    |> process
    |> IO.inspect
  end
end