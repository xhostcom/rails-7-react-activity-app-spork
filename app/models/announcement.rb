# frozen_string_literal: true

class Announcement < ApplicationRecord # rubocop:todo Style/Documentation
  TYPES = %w[new fix update].freeze

  after_initialize :set_defaults

  validates :announcement_type, :description, :name, :published_at, presence: true
  validates :announcement_type, inclusion: { in: TYPES }

  def set_defaults
    self.published_at      ||= Time.zone.now
    self.announcement_type ||= TYPES.first
  end
end
