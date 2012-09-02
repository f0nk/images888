class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :title
      t.text :keyword
      t.text :description
      t.string :source
      t.string :image_url
      t.string :article_url

      t.timestamps
    end
  end
end
