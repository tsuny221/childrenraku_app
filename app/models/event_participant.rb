class EventParticipant < ApplicationRecord
  belongs_to :event_attendance, optional: true
  enum number_of_people: {"0": 0, "1": 1, "2": 2, "3": 3 }
  enum relationship_name: { 父: 1, 母: 2, 児童: 3, 未就学児: 4, その他: 5 }
end
