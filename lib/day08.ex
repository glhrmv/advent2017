defmodule Advent2017.Day08 do
  @input File.read!("inputs/day08.txt")
  
  def input, do: @input
  
  def parse_instructions(instruction) do
    # Parse the instruction using pattern matching
    [reg, op, arg, "if", ctarget, copt, carg] = String.split(instruction)
    
    %{
      reg: reg, # Name of the register
      op: op, # Operation to perform (inc, dec)
      arg: String.to_integer(arg), # Value to perform the operation with
      ctarget: ctarget, # Target register to compare with
      copt: copt, # Comparison operator (>, <, ==, ...)
      carg: String.to_integer(carg) # Value to compare target's value with
    }
  end
  
  def check_condition(curr, registers) do
    ctarget_reg = Map.get(registers, curr.ctarget, 0)
    
    case curr.copt do
      ">" -> ctarget_reg > curr.carg
      "<" -> ctarget_reg < curr.carg
      ">=" -> ctarget_reg >= curr.carg
      "==" -> ctarget_reg == curr.carg
      "<=" -> ctarget_reg <= curr.carg
      "!=" -> ctarget_reg != curr.carg
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

  # Initialise the registers map before 
  # going through instructions
  def run(input, regs \\ %{})
  def run([curr | rest], regs) do
    if check_condition(curr, regs) do
      reg = update_registers(curr, regs)
      run(rest, reg)
    else
      run(rest, regs)
    end
  end

  def run([], regs) do
    regs
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
