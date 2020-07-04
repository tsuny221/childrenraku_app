class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :last_name_kana, :string
    add_column :users, :phone_number, :string
    add_column :users, :postcode, :string
    add_column :users, :address, :string
    add_column :users, :profile_image, :string
    add_column :users, :family_id, :integer
  end
end
