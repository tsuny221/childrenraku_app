class Inquiry < ApplicationRecord
  validates :name, presence: true
  validates :phone_number, presence: true, format: { with: /\A[0-9]+\z/, message: "半角数字のみで入力してください" }
  validates :email, presence: true
  validates :message, presence: true
end
