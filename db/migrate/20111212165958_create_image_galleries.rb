class CreateImageGalleries < ActiveRecord::Migration
  def change
    create_table :image_galleries do |t|
      t.string :name, :null => false
      t.integer :customer_id, :null => false
    end
  end
end
