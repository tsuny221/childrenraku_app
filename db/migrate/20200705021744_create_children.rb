class CreateChildren < ActiveRecord::Migration[5.2]
  def change
    create_table :children do |t|
      t.string :first_name
      t.string :last_name
      t.string :first_name_kana
      t.string :last_name_kana
      t.integer :grade
      t.string :school_class
      t.integer :gender
      t.string :allergy
      t.string :special_notes
      t.boolean :room_access, default: false
      t.references :family
      t.references :user
      t.timestamps
    end
  end
end
