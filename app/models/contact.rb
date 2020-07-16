class Contact < ApplicationRecord
  attachment :image
  belongs_to :room, optional: true
  belongs_to :group, optional: true
  validates :subject, presence: true, length: { maximum: 10 }
  validates :text, presence: true
end
