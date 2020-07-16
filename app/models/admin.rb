class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :room, dependent: :destroy

  validates :name, presence: true, length: { maximum: 10, minimum: 2 }

  def active_for_authentication?
    super && (is_deleted == false)
  end
end
