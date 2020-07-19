class ContactUser < ApplicationRecord
  belongs_to :user
  belongs_to :contact

  validates :user_id, :uniqueness => { :scope => :contact_id }
  # 同じ子どもで同じ日時の予定を二回以上作成できない
end
