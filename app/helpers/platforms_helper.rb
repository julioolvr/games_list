# frozen_string_literal: true

module PlatformsHelper
  def platform_badge(platform)
    tag.a(
      platform.name,
      class: 'badge badge-pill badge-info',
      href: games_path(q: { platforms_id_eq: platform.id })
    )
  end
end
