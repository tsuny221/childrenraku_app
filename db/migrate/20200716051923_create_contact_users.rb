class CreateContactUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_users do |t|
      t.references :user, foreign_key: true
      t.references :contact, foreign_key: true
      t.boolean :read

      t.timestamps
    end
  end
end
