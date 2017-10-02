defmodule ELIXIR_MODULE.Mixfile do
  use Mix.Project

  def project do
    [app: :APP_NAME
     version: "0.0.1",
     deps: deps(),
     description: description(),
     package: package()]
  end

  defp description do
    """
    APP_NAME
    """
  end

  defp package do
    [maintainers: ["Ilya Khaprov"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/deadtrickster/APP_NAME"},
     files: ["priv", "src", "README.md", "rebar.config"]]
  end

  defp deps do
    []
  end
end
