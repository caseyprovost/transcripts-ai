# config/initializers/ruby_llm.rb or similar
RubyLLM.configure do |config|
  config.openai_api_key = ENV.fetch("OPENAI_API_KEY", nil)
  config.openrouter_api_key = ENV.fetch("OPEN_ROUTER_API_KEY", nil)
  # Add keys ONLY for providers you intend to use
  # config.anthropic_api_key = ENV.fetch('ANTHROPIC_API_KEY', nil)
  # ... see Configuration guide for all options ...

  config.default_model = "anthropic/claude-sonnet-4"
end
