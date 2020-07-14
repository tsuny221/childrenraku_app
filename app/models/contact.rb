class Contact < ApplicationRecord
  attachment :image
  belongs_to :room, optional: true
  validates :subject, presence: true
  validates :text, presence: true
end
