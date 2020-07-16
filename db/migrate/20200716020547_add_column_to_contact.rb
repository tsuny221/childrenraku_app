class AddColumnToContact < ActiveRecord::Migration[5.2]
  def change
    add_reference :contacts, :group, foreign_key: true
    remove_column :contacts, :file, :string
  end
end
