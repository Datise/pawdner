# frozen_string_literal: true

# Stores the qualities users would like to receive in their prompts
class UserSetting < ApplicationRecord
  belongs_to :user

  enum length: { short: 0, mid: 1, long: 2 }, _default: :short
  enum sentimentality: { low: 0, medium: 1, high: 2 }, _default: :low
end
