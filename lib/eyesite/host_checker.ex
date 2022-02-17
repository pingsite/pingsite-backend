defmodule Eyesite.Hostchecker do
  require Logger

  def check(host, port) when is_number(port) do

    IO.inspect(host)
    IO.inspect(port)
    Logger.info("Checking #{host}:#{port}")

    case :gen_tcp.connect(to_charlist(host), port, [:binary]) do
      {:ok, _} ->
        {:ok, "Success"}

      {:error, reason} ->
        {:error, reason}
    end
  end
end