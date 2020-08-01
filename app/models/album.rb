class Album < ApplicationRecord
  has_many_attached :images
  belongs_to :room, optional: true
  has_many :tags, dependent: :destroy
  validates :images, presence: true
  validates :name, presence: true
end
