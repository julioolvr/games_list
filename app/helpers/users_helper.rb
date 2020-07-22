# frozen_string_literal: true

require 'digest'

module UsersHelper
  def avatar_url(user)
    digest = Digest::MD5.hexdigest(user.email.strip)
    "https://www.gravatar.com/avatar/#{digest}?d=robohash"
  end
end
