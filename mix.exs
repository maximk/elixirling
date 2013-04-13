defmodule Elixirling.Mixfile do
  use Mix.Project

  def project do
    [ app: :elixirling,
      version: "0.0.1",
      dynamos: [Elixirling.Dynamo],
      compilers: [:elixir, :dynamo, :app],
      env: [prod: [compile_path: "ebin"]],
      compile_path: "tmp/#{Mix.env}/elixirling/ebin",
	  lingex_opts: [build_host: "build.erlangonxen.org:8080",
					username: "test",
					password: "test",
					import_lib: "syntax_tools",
					elixir_lib: true,
					import: "priv/*/*"],
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ applications: [:cowboy, :dynamo],
      mod: { Elixirling, [] } ]
  end

  defp deps do
    [ { :ranch, %r(.*), github: "extend/ranch" },
      { :cowboy, %r(.*), github: "extend/cowboy" },
      { :dynamo, "0.1.0.dev", github: "elixir-lang/dynamo" },
	  { :lingex, %r(.*), github: "maximk/lingex" } ]
  end
end
