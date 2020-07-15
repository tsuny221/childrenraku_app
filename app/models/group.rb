class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  belongs_to :room, optional: true

  validates :name, presence: true, uniqueness: true
end
