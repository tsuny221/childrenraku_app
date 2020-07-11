class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :subject
      t.string :text
      t.string :image_id
      t.string :file
      t.references :room
      t.timestamps
    end
  end
end
