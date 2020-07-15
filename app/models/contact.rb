class Contact < ApplicationRecord
  attachment :image
  belongs_to :room, optional: true

  validates :subject, presence: true, length: { maximum: 10 }
  validates :text, presence: true
end
