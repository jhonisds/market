Projeto market desenvolvido com a linguagem funcional `Elixir versão 1.11.2`. Tem como principal objetivo aplicar os
requisitos do [programa de formação em Elixir](https://gist.github.com/programa-elixir/1bd50a6d97909f2daa5809c7bb5b9a8a).

## Índice

- [Market](#market)
- [Execução](#execução)
- [Testes](#testes)
- [Referências](#referências)

## Market

Dado uma lista de compras e uma lista de clientes. O projeto permite calcular o valor total da lista e dessa forma dividir
o valor baseado na lista de emails. Caso houver valor residual deve ser distribuido da forma mais igualitária possível.

## Execução

No diretório do projeto abra o terminal e execute o shell interativo do Elixir com o comando `iex -S mix` e informe os comandos descritos abaixo:

> `list_customers/1` Gera lista aleatória de clientes.

```elixir
Customer.list_customers(3)
[
  %Market.Customer{email: "brooks@hotmail.com", id: 4, name: "Brooks"},
  %Market.Customer{email: "haille@gmail.com", id: 3, name: "Haille"},
  %Market.Customer{email: "macey@gmail.com", id: 5, name: "Macey"}
]
```

> `list_items/1` Gera lista aleatória de itens.

```elixir
Item.list_items(3)
[
  %Market.Item{amount: 10, id: 2, name: "Milk", price: 3},
  %Market.Item{amount: 10, id: 10, name: "Cheese", price: 5},
  %Market.Item{amount: 10, id: 9, name: "Fish", price: 5}
]
```

> `split_bill/2` Recebe como parâmetros lista de clientes e itens.

```elixir

customers = Customer.list_customers(5)
items = Item.list_items(3)

Market.split_bill(customers, items)
{:ok,
 [
   customers: [
     %{bill: 27, email: "lexie@gmail.com", name: "Lexie"},
     %{bill: 27, email: "brice@gmail.com", name: "Brice"},
     %{bill: 27, email: "mary@gmail.com", name: "Mary"},
     %{bill: 27, email: "brooks@hotmail.com", name: "Brooks"},
     %{bill: 26, email: "norris@hotmail.com", name: "Norris"}
   ],
   total: 134,
   remaining: 4
 ]}
```

## Testes

Comando para execução dos testes:

```sh
mix test
```

## Referências

- [Elixir School](https://elixirschool.com/pt/)
- [Elixir lang](https://elixir-lang.org/getting-started/introduction.html)
