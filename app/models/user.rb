# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_one :settings, class_name: 'UserSetting', dependent: :destroy
  after_create :create_settings!
end
