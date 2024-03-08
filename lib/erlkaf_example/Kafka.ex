defmodule ErlkafExample.Kafka do
  @kb 1024
  @mb 1024 * @kb
  def consumer_group(options \\ []) do
    brokers = System.get_env("KAFKA_BROKERS", "")
    handler = Keyword.get(options, :handler)
    topic = Keyword.get(options, :topic)
    group_id = options |> Keyword.get(:group_id) |> to_string()
    client_id = Keyword.get(options, :client_id, handler)
    max_bytes = Keyword.get(options, :max_bytes, @mb)
    security_protocol = Keyword.get(options, :security_protocol, :plaintext)

    # smallest, earliest, beginning, largest, latest, end, error
    auto_offset_reset = Keyword.get(options, :auto_offset_reset, :latest)

    topics = [
      {topic, [callback_module: handler, callback_args: [], dispatch_mode: :one_by_one]}
    ]

    client_config = [
      bootstrap_servers: brokers,
      security_protocol: security_protocol,
      message_max_bytes: max_bytes
    ]

    topic_config = [auto_offset_reset: auto_offset_reset]

    IO.puts("Starting consumer group")

    :erlkaf.create_consumer_group(client_id, group_id, topics, client_config, topic_config)
  end
end
