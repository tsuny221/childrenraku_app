class Inquiry < ApplicationRecord
  validates :name, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
  validates :message, presence: true
end
