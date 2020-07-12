class AddColumnImageToContact < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :image_filename, :string
    add_column :contacts, :image_content_type, :string
  end
end
