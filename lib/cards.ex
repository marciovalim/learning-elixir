defmodule Cards do
  @moduledoc """
    Provides methods to create and handle a deck of cards
  """
  def createDeck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def create_hand(hand_size) do
    createDeck()
    |> deal(hand_size)
  end

  def deal(deck, hand_size) do
    {hand, _} =
      shuffle(deck)
      |> Enum.split(hand_size)

    hand
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "File does not exists"
    end
  end
end
