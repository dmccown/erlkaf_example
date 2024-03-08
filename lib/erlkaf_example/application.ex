defmodule ErlkafExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  alias ErlkafExample.Kafka

  def start(_type, _args) do
    :erlkaf_example
    |> Application.get_env(:enabled_topics, [])
    |> IO.inspect()
    |> Enum.map(&Application.get_env(:erlkaf_example, &1))
    |> Enum.each(&Kafka.consumer_group/1)
    
    IO.puts("foo")

    children = []

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ErlkafExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
