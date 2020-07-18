# frozen_string_literal: true

module ClassNamesHelper
  def class_names(definition)
    definition.filter_map { |(k, v)| k if v }.join(' ')
  end
end
