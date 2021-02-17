defmodule Market.Item do
  @moduledoc """
  This module defines the `item` structure.
  """

  defstruct id: nil, name: nil, amount: nil, price: nil

  def all do
    [
      %__MODULE__{
        id: 1,
        name: "Orange",
        amount: 10,
        price: 2
      },
      %__MODULE__{
        id: 2,
        name: "Milk",
        amount: 10,
        price: 3
      },
      %__MODULE__{
        id: 3,
        name: "Potatoes",
        amount: 10,
        price: 5
      },
      %__MODULE__{
        id: 4,
        name: "Butter",
        amount: 20,
        price: 8
      },
      %__MODULE__{
        id: 5,
        name: "Apple",
        amount: 15,
        price: 5
      },
      %__MODULE__{
        id: 6,
        name: "Tomatoes",
        amount: 16,
        price: 4
      },
      %__MODULE__{
        id: 7,
        name: "Beverages",
        amount: 8,
        price: 15
      },
      %__MODULE__{
        id: 8,
        name: "Mushrooms",
        amount: 10,
        price: 5
      },
      %__MODULE__{
        id: 9,
        name: "Fish",
        amount: 10,
        price: 5
      },
      %__MODULE__{
        id: 10,
        name: "Cheese",
        amount: 10,
        price: 5
      }
    ]
  end

  def list_items(amount) when amount <= 0 do
    {:error, "parameter must be greater than zero: #{amount}"}
  end

  def list_items(amount), do: Enum.take_random(all(), amount)
end
