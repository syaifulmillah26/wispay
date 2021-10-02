# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application
Rails.application.load_server

require 'rack/cors'
use Rack::Cors do
  # allow all origins in development
  allow do
    origins '*'
    resource '*',
             headers: :any,
             methods: %i[get post put patch delete options head],
             credentials: false
  end
end
