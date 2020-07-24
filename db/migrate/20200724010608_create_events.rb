class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :room
      t.datetime :start_time
      t.string :explanation
      t.timestamps
    end
  end
end
