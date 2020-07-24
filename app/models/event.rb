class Event < ApplicationRecord
  belongs_to :room, optional: true
  has_many :event_attendances, dependent: :destroy
  validates :start_time, presence: true
  validates :title, presence: true, length: { maximum: 10 }
  validates :explanation, presence: true
end
