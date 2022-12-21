# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

config.cache_classes = false
config.action_view.cache_template_loading = true