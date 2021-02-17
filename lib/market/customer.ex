defmodule Market.Customer do
  @moduledoc """
  This module defines the `customer` structure.
  """
  defstruct id: nil, name: nil, email: nil

  def all do
    [
      %__MODULE__{id: 1, name: "Paul", email: "paul@gmail.com"},
      %__MODULE__{id: 2, name: "Mary", email: "mary@gmail.com"},
      %__MODULE__{id: 3, name: "Haille", email: "haille@gmail.com"},
      %__MODULE__{id: 4, name: "Brooks", email: "brooks@hotmail.com"},
      %__MODULE__{id: 5, name: "Macey", email: "macey@gmail.com"},
      %__MODULE__{id: 6, name: "Watson", email: "watson@gmail.com"},
      %__MODULE__{id: 7, name: "Norris", email: "norris@hotmail.com"},
      %__MODULE__{id: 8, name: "Brice", email: "brice@gmail.com"},
      %__MODULE__{id: 9, name: "Harley", email: "harley@gmail.com"},
      %__MODULE__{id: 10, name: "Lexie", email: "lexie@gmail.com"}
    ]
  end

  def list_customers(amount) when amount <= 0 do
    {:error, "parameter must be greater than zero: #{amount}"}
  end

  def list_customers(number), do: Enum.take_random(all(), number)
end
