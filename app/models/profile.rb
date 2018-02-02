class Profile < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :body, presence: true
end
