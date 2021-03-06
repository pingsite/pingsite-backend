defmodule PingSiteWeb.MobileAlertChannel do
  use PingSiteWeb, :channel

  def join("updates:errors", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (flutter_chat:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  def handle_in("say", payload, socket) do
    broadcast socket, "say", payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_) do
    true
  end

end
