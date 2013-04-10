Dynamo.under_test(Elixirling.Dynamo)
Dynamo.Loader.enable
ExUnit.start

defmodule Elixirling.TestCase do
  use ExUnit.CaseTemplate

  # Enable code reloading on test cases
  setup_all do
    Dynamo.Loader.enable
    :ok
  end
end
