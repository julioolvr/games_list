# frozen_string_literal: true

class SendgridConfig < ApplicationConfig
  attr_config :api_key
  required :api_key if Rails.env.production?
end
