class Child < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :family, optional: true
  has_many :plans, dependent: :destroy

  validates :school_class, presence: true
  validates :grade, presence: true
  validates :first_name, presence: true
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力して下さい" }
  validates :last_name, presence: true
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力して下さい" }

  enum gender: { 男: 1, 女: 2, その他: 3 }
  enum grade: {'年少': 1, '年中': 2, '年長': 3, '1年': 4, '2年': 5, '3年': 6, '4年': 7, '5年': 8, '6年': 9 }
  enum room_access: { 入室: true, 退室: false }
  def full_name
    "#{last_name} #{first_name}"
  end

  def full_name_kana
    "#{last_name_kana} #{first_name_kana}"
  end
end
