defmodule GRPC.Mixfile do
  use Mix.Project

  @version "0.7.0"

  def project do
    [
      app: :grpc,
      version: @version,
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: "The Elixir implementation of gRPC",
      docs: [
        extras: ["README.md"],
        main: "readme",
        source_ref: "v#{@version}",
        source_url: "https://github.com/elixir-grpc/grpc"
      ],
      dialyzer: [
        plt_add_apps: [:mix, :iex]
      ],
      xref: [exclude: [IEx]]
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:protobuf, "== 0.8.0"},
      {:gun, "~> 2.0", hex: :grpc_gun, organization: "tubitv"},
      {:cowboy, "~> 2.9"},
      {:ex_doc, "~> 0.25", only: :dev},
      {:inch_ex, "~> 2.0", only: [:dev, :test]},
      {:dialyxir, "~> 1.1", only: [:dev, :test], runtime: false}
    ]
  end

  # defp package do
  #   %{
  #     maintainers: ["Bing Han"],
  #     licenses: ["Apache 2"],
  #     links: %{"GitHub" => "https://github.com/elixir-grpc/grpc"},
  #     files: ~w(mix.exs README.md lib src config LICENSE .formatter.exs)
  #   }
  # end

  defp package do
    %{
      organization: "tubitv",
      maintainers: "",
      licenses: ["Apache 2"],
      links: %{"GitHub" => "https://github.com/elixir-grpc/grpc"},
      files: ~w(mix.exs README.md lib src config LICENSE .formatter.exs)
    }
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
