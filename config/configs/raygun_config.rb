# frozen_string_literal: true

class RaygunConfig < ApplicationConfig
  attr_config :rum_apikey

  def configured?
    rum_apikey.present?
  end
end
