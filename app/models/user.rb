class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, invite_for: 24.hours
  belongs_to :room, optional: true
  belongs_to :family, optional: true
  has_many :children, dependent: :destroy
  def full_name
    "#{self.last_name} #{self.first_name}"
  end
  def full_name_kana
     "#{self.last_name_kana } #{self.first_name_kana}"
  end
  def full_address
    "〒#{self.postcode} #{self.address}"
  end
end
