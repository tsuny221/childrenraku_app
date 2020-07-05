class Family < ApplicationRecord
  belongs_to :room
  has_many :users, dependent: :destroy
  has_many :children, dependent: :destroy
end
