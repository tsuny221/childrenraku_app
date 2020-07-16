class Contact < ApplicationRecord
  attachment :image
  belongs_to :room, optional: true
  belongs_to :group, optional: true
  has_many :contact_users, dependent: :destroy
  has_many :users, through: :contact_users

  validates :subject, presence: true, length: { maximum: 10 }
  validates :text, presence: true
end
