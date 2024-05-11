# frozen_string_literal: true

module ImageAttachable
  extend ActiveSupport::Concern

  included do
    has_many_attached :images
  end
end