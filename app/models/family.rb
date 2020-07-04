class Family < ApplicationRecord
  belongs_to :room
  has_many :users
end
