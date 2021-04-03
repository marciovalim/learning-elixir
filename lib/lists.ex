defmodule Lists do
  def create_list do
    list = [{:primary, "blue"}, {:secondary, "red"}, {:secondary, "yellow"}]
    IO.inspect(list)

    other_list = [primary: 10, secondary: 20, secondary: 40]
    IO.inspect(other_list)

    other_list[:secondary]
  end
end
