defmodule ErlkafExample.Handlers.Example do
  @moduledoc """
  Handle messages from compact entitlement topic
  """

  @behaviour :erlkaf_consumer_callbacks

  @impl true
  def init(_topic, _partition, _offset, _args) do
    {:ok, []}
  end

  # message is an erlkaf_msg record
  @impl true
  def handle_message(message, state) do
    IO.inspect(message)

    {:ok, state}
  end
end