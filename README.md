# ElixirExtensions

A set of convenient extensions for developing services with Elixir/Phoenix

## Installation

the package can be installed by adding `elixir_extensions` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:elixir_extensions, "~> 0.1.0"}
  ]
end
```

## Usage
### Core(String,Map)
- For extending `String`, `Map` utility functions.
```elixir
  use ElixirExtensions # import core extentions
```
- `underscore_keys`
```elixir
iex> underscore_keys(%{"helloWorld" => "elixirHi"})
%{"hello_world" => "elixirHi"}
```
- `truncate`
```elixir
iex> truncate("hello world", length: 5)
"he..."
```
- `stringify_keys`
```elixir
iex> stringify_keys(%{hello: "world"})
%{"hello" => "world"}
```
- `slugify`
```elixir
iex> slugify("hello world")
"hello-world"

iex> slugify("Hello world", separator: "")    
"helloworld"
```
### Ecto
- Extend Repo with some useful functions.
```elixir
  defmodule MyApp.Repo do
    use Ecto.Repo,
      otp_app: :my_app,
      adapter: Ecto.Adapters.Postgres

    use ElixirExtensions.Ecto.RepoExt # Add this line to your repo.
  end
```
- Extend Changeset with some useful functions.
```elixir
 defmodule MyApp.Accounts.User do
    use Ecto.Schema
    import Ecto.Changeset
    alias ElixirExtensions.Ecto.ChangesetExt #  Add this line to your schema file.
    ...
  end
```
- Extend Ecto.Query with some useful functions.
```elixir
  import Ecto.Query, warn: false
  alias ElixirExtensions.Ecto.QueryExt #  Add this line to your Context module file.
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/elixir_extensions>.

