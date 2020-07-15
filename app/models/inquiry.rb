class Inquiry < ApplicationRecord
  validates :name, presence: true
  validates :phone_number, presence: true, format: {with: /\A\d{10,11}\z/}
  validates :email, presence: true
  validates :message, presence: true
end
