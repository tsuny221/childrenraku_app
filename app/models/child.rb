class Child < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :family, optional: true
  enum room_access: { 入室: true, 退室: false }
  def full_name
    "#{self.last_name} #{self.first_name}"
  end
  def full_name_kana
     "#{self.last_name_kana } #{self.first_name_kana}"
  end
  enum gender: { 男: 1, 女: 2, その他: 3}
end
