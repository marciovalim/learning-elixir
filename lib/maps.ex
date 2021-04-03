defmodule Maps do
  @moduledoc """
    Provides a set of functions to test and learn maps in Elixir.
  """

  def creating_maps do
    # We use `%` char and then curly braces
    colors = %{primary: "blue", secondary: "red"}
    colors
  end

  def pattern_matching do
    colors = creating_maps()
    # example of pattern matching with maps
    %{primary: receive_primary} = colors
    receive_primary
  end

  def update_data do
    colors = creating_maps()

    # Option 1 to modify the map
    # Here we modify the `primary` key to `"new_color"`
    # With Map.put, we can modify or add new keys to the map
    colors = Map.put(colors, :primary, "new_color")

    # Option 2 to modify the map
    # Here we modify the `secondary` key to `"new_color"`
    # With this syntax, we can only modify existing keys
    colors = %{colors | secondary: "new_color"}

    colors
  end
end
