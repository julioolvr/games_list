# frozen_string_literal: true

module Auth
  class RegistrationsController < Devise::RegistrationsController
    skip_after_action :verify_authorized # TODO: Verify edit self?
    skip_after_action :verify_policy_scoped
  end
end
