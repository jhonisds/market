defmodule Market do
  @moduledoc """
  This module provides the `split_bill` function that distributes value among customers.
  """

  @doc """
  Split bill.

  ## Examples

      iex> split_bill(customers, items)
      {:ok, customers: [%{bill: 61, email: "watson@gmail.com", name: "Watson"}, ...], total: 365, remaining: 5}

      iex> split_bill([], [])
      {:error, "lists can't be empty"}

      iex> split_bill([], items)
      {:error, "customer list can't be empty"}

      iex> split_bill(customers, [])
      {:error, "item list can't be empty"}

  """
  def split_bill([], []), do: {:error, "lists can't be empty"}
  def split_bill([], _items), do: {:error, "customer list can't be empty"}
  def split_bill(_customers, []), do: {:error, "item list can't be empty"}

  def split_bill(customers, items) do
    value =
      items
      |> total_price()
      |> value_for_each(customers, :div)

    update(customers, value, total_price(items))
  end

  defp total_price(items), do: Enum.reduce(items, 0, &(&1.price * &1.amount + &2))

  defp value_for_each(value, customers, :div), do: div(value, length(customers))
  defp value_for_each(value, customers, :rem), do: rem(value, length(customers))

  defp update(customers, value, total) do
    remaining = abs(value_for_each(total, customers, :rem))

    {head, tail} =
      customers
      |> Enum.map(&%{email: &1.email, bill: value, name: &1.name})
      |> Enum.split(remaining)

    result = Enum.map(head, &%{&1 | bill: value + 1}) ++ tail

    {:ok, customers: result, total: total, remaining: remaining}
  end
end
