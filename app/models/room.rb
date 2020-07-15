class Room < ApplicationRecord
  validates :key, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

  belongs_to :admin
  has_many :families, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :groups, dependent: :destroy
end
