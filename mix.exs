defmodule ElixirExtensions.MixProject do
  use Mix.Project

  @version "0.1.1"
  @scm_url "https://github.com/suhanlee/elixir_extensions"
  @elixir_requirement "~> 1.11"
  @description "A set of convenient extensions for developing services with Elixir/Phoenix"

  def project do
    [
      app: :elixir_extensions,
      version: @version,
      elixir: @elixir_requirement,
      start_permanent: Mix.env() == :prod,
      description: @description,
      deps: deps(),
      package: package(),
      docs: docs(),
      name: "elixir_extensions"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:number, "~> 1.0.1"},
      {:ecto, "~> 3.10"},
      {:query_builder, "~> 1.0.1"},
      {:email_checker, "~> 0.2.4"},
      {:html_sanitize_ex, "~> 1.4"},
      {:slugify, "~> 1.3"},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
      {:makeup_html, ">= 0.0.0", only: :dev, runtime: false},
      {:dialyxir, "~> 1.3", only: [:dev], runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["suhanlee"],
      licenses: ["MIT"],
      links: %{"GitHub" => @scm_url},
      files: ~w(lib LICENSE.md mix.exs README.md .formatter.exs)
    ]
  end

  defp docs do
    [
      main: "ElixirExtensions",
      extras: ["README.md"]
    ]
  end
end
