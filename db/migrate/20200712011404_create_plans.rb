class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :date
      t.string :attendance
      t.string :comment
      t.references :child
      t.timestamps
    end
  end
end
