class Plan < ApplicationRecord
  belongs_to :child
  validates :child_id, presence: true
  enum attendance: { 出席: 1, 欠席: 2, 保留: 3 }
end
