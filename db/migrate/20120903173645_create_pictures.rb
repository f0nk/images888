class CreatePictures < ActiveRecord::Migration
  def up
  	create_table :pictures do |t|
  		t.string :url
  		t.references :item
  	end

  end

  def down
  	drop_table :pictures
  end
end
