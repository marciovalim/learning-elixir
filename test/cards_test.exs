defmodule CardsTest do
  use ExUnit.Case
  # doctest Cards

  test "createDeck should return 20 cards" do
    length = length(Cards.createDeck())
    assert length == 20
  end
end
