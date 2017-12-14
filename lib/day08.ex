defmodule Advent2017.Day08 do
  @input File.read!("inputs/day08.txt")
  
  def input do
    @input
  end
  
  def parse_instructions(input) do
    [reg, op, arg, "if", ctarget, copt, carg] = String.split(input)
    
    %{
      reg: reg,
      op: op,
      arg: String.to_integer(arg),
      ctarget: ctarget,
      copt: copt,
      carg: String.to_integer(carg)
    }
  end
  
  def check_condition(curr, registers) do
    condition_target_reg = Map.get(registers, curr.ctarget, 0)
    
    case curr.copt do
      ">" -> condition_target_reg > curr.carg
      "<" -> condition_target_reg < curr.carg
      ">=" -> condition_target_reg >= curr.carg
      "==" -> condition_target_reg == curr.carg
      "<=" -> condition_target_reg <= curr.carg
      "!=" -> condition_target_reg != curr.carg
    end
  end

  def update_with(curr, registers, fun) do
    updated = fun.(Map.get(registers, curr.reg, 0), curr.arg)
    
    Map.put(registers, curr.reg, updated)
  end

  def update_registers(curr, registers) do
    case curr.op do
      "inc" -> update_with(curr, registers, &(&1 + &2))
      "dec" -> update_with(curr, registers, &(&1 - &2))
    end
  end

  def run(input, registers \\ %{})
  def run([curr | rest], reg) do
    if check_condition(curr, reg) do
      reg = update_registers(curr, reg)
      run(rest, reg)
    else
      run(rest, reg)
    end
  end
  
  def run([], reg) do
    reg
  end
end

defmodule Advent2017.Day08.Part1 do
  import Advent2017.Day08
  
  def run do
    input()
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_instructions/1)
    |> run
    |> Map.values
    |> Enum.max
    |> IO.inspect
  end
end
