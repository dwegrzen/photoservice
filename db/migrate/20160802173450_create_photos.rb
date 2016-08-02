class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :caption
      t.string :from_email
      t.text :body

      t.timestamps
    end
  end
end
