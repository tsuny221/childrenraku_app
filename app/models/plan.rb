class Plan < ApplicationRecord
  belongs_to :child, optional: true
  # 同じ子どもで同じ日時の予定を二回以上作成できない
  validates :start_time, presence: true, :uniqueness => { :scope => :child_id }
  validates :child_id, presence: true
  validates :attendance, presence: true
  enum attendance: { 出席: 1, 欠席: 2, 保留: 3 }
end
