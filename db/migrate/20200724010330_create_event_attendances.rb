class CreateEventAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :event_attendances do |t|
      t.references :event
      t.references :family
      t.integer :attendance
      t.string :comment
      t.timestamps
    end
  end
end
