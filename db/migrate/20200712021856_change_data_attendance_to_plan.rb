class ChangeDataAttendanceToPlan < ActiveRecord::Migration[5.2]
  def change
    change_column :plans, :attendance, :integer
  end
end
