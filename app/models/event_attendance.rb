class EventAttendance < ApplicationRecord
  belongs_to :event, optional: true
  has_many :event_participants
  accepts_nested_attributes_for :event_participants, allow_destroy: true
  enum attendance: { 出席: 1, 欠席: 2, 保留: 3 }
  validates :family_id, :uniqueness => { :scope => :event_id }
  validates :attendance, presence: true
end
