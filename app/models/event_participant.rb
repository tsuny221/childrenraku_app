class EventParticipant < ApplicationRecord
  belongs_to :event_attendance, optional: true
  enum number_of_people: { "0": 0, "1": 1, "2": 2, "3": 3 }
  enum relationship_name: { 父: 0, 母: 1, 児童: 2, 未就学児: 3, その他: 4 }
end
