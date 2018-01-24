class Profile < ApplicationRecord::Base
  validates :name, presence: true
  validates :location, presence: true
  validates :body, presence: true
end
