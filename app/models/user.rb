class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, invite_for: 24.hours
  belongs_to :room, optional: true
  belongs_to :family, optional: true
  has_many :children, dependent: :destroy
  def full_name
    "#{last_name} #{first_name}"
  end

  def full_name_kana
    "#{last_name_kana} #{first_name_kana}"
  end

  def full_address
    "〒#{postcode} #{address}"
  end

  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end
