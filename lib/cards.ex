defmodule Cards do
  @moduledoc """
    Provides methods to create and handle a deck of cards
  """

  @doc """
    Return a list of strings representing a deck of cards.
  """
  def createDeck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Given a deck of cards, return the same deck but shuffled.
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Return if the `deck` contains a specific `card`.
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Given a `hand_size`, return a list of random cards.
  """
  def create_hand(hand_size) do
    createDeck()
    |> deal(hand_size)
  end

  @doc """
    Given a `deck` of cards, return a hand with random cards of the deck.

  ## Example

      iex> deck = Cards.createDeck
      iex> hand = Cards.deal(deck, 3)
      iex> hand
      ["Two of Clubs", "Three of Hearts", "Three of Diamonds"]

  """
  def deal(deck, hand_size) do
    {hand, _} =
      shuffle(deck)
      |> Enum.split(hand_size)

    hand
  end

  @doc """
    Given a `deck` of cards, saves it to storage with a `filename`.
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    Load a deck of cards from storage given a `filename` as path.
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "File does not exists"
    end
  end
end
