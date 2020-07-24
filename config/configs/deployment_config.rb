# frozen_string_literal: true

class DeploymentConfig < ApplicationConfig
  attr_config :host, port: 80
  required :host, :port
end
