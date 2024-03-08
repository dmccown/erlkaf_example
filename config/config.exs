import Config

config :erlkaf_example, :enabled_topics, [:example]

config :erlkaf_example, :example,
  group_id: "erlkaf-example-consumer",
  client_id: :erlkaf_example,
  topic: "example",
  handler: ErlkafExample.Handlers.Example

import_config "#{config_env()}.exs"