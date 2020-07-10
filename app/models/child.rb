class Child < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :family, optional: true
  validates :grade, presence: true, numericality: { only_integer: true },format: {with: /\A[0-9]+\z/, message: "半角数字のみが使えます"}
  enum room_access: { 1: 1, 2: 2, 3: 3, 4: 4, 5: 5, 6: 6 }
  enum room_access: { 入室: true, 退室: false }
  def full_name
    "#{self.last_name} #{self.first_name}"
  end
  def full_name_kana
     "#{self.last_name_kana } #{self.first_name_kana}"
  end
  enum gender: { 男: 1, 女: 2, その他: 3}
end
