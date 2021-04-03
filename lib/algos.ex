defmodule Algos do
  def fibonacci_at(position) do
    sequence = fibonacci_sequence(position)
    List.last(sequence)
  end

  def fibonacci_sequence(count) do
    fibonacci([1, 1], count)
  end

  defp fibonacci(sequence, max) do
    cond do
      length(sequence) >= max ->
        sequence

      true ->
        previous2 = Enum.at(sequence, length(sequence) - 2)
        previous1 = Enum.at(sequence, length(sequence) - 1)
        previousSum = previous2 + previous1
        fibonacci(sequence ++ [previousSum], max)
    end
  end

  def factorial(num) do
    cond do
      num <= 1 ->
        1

      true ->
        factorial(num - 1) * num
    end
  end
end
