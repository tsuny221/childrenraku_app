class Child < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :family, optional: true
  enum room_access: { 入室: true, 退室: false }
end
