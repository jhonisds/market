defmodule MarketTest do
  use ExUnit.Case

  @attrs_items [
    %{id: 1, amount: 10, name: "Cheese", price: 2},
    %{id: 2, amount: 10, name: "Tomatoes", price: 3},
    %{id: 3, amount: 10, name: "Beverages", price: 5}
  ]

  @attrs_items_price [
    %{id: 1, amount: 50, name: "Cheese", price: 1000},
    %{id: 2, amount: 100, name: "Tomatoes", price: 1000}
  ]

  @attrs_customers [
    %{id: 1, name: "Paul", email: "paul@gmail.com"},
    %{id: 2, name: "Mary", email: "mary@gmail.com"},
    %{id: 3, name: "Haille", email: "haille@gmail.com"}
  ]

  @expected [
    %{bill: 34, email: "paul@gmail.com", name: "Paul"},
    %{bill: 33, email: "mary@gmail.com", name: "Mary"},
    %{bill: 33, email: "haille@gmail.com", name: "Haille"}
  ]

  setup do
    [
      valid_customers: @attrs_customers,
      valid_items: @attrs_items,
      expected: @expected,
      items_price: @attrs_items_price,
      invalid_customers: [],
      invalid_items: []
    ]
  end

  test "split_bill/2 with valid lists returns the bill for each customer", %{
    valid_customers: customers,
    valid_items: items,
    expected: expected_result
  } do
    assert {:ok, result} = Market.split_bill(customers, items)
    assert result[:customers] == expected_result
    assert result[:total] == 100
    assert result[:remaining] == 1
  end

  test "split_bill/2 with valid lists returns the bill for each customer and no remaining", %{
    valid_customers: customers,
    items_price: items
  } do
    assert {:ok, result} = Market.split_bill(customers, items)
    assert result[:remaining] == 0
  end

  test "split_bill/2 with invalid list returns an error", %{
    invalid_customers: customers,
    invalid_items: items
  } do
    assert {:error, result} = Market.split_bill(customers, items)
    assert result == "lists can't be empty"
  end

  test "split_bill/2 with invalid customer list returns an error", %{
    invalid_customers: customers,
    valid_items: items
  } do
    assert {:error, result} = Market.split_bill(customers, items)
    assert result == "customer list can't be empty"
  end

  test "split_bill/2 with invalid item list returns an error", %{
    valid_customers: customers,
    invalid_items: items
  } do
    assert {:error, result} = Market.split_bill(customers, items)
    assert result == "item list can't be empty"
  end
end
