class AddColumnIsDeletedToAdmin < ActiveRecord::Migration[5.2]
  def change
     add_column :admins, :is_deleted, :boolean, default: false
  end
end
