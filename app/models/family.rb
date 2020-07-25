class Family < ApplicationRecord
  belongs_to :room, optional: true
  has_many :users, dependent: :destroy
  has_many :children, dependent: :destroy
  has_many :event_attendances, dependent: :destroy
end
