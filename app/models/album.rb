class Album < ApplicationRecord
  has_many_attached :images
  belongs_to :room, optional: true
end
