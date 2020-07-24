class CreateEventParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :event_participants do |t|
      t.references :event_attendance
      t.integer :number_of_people
      t.integer :relationship_name
      t.timestamps
    end
  end
end
