class AddEmailImageToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :email_image_id, :string
  end
end
