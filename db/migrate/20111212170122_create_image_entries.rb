class CreateImageEntries < ActiveRecord::Migration
  def change
    create_table :image_entries do |t|
      t.text :description, :null => false
      t.string :image, :null => false
      t.date :imagedate, :null => false
      t.integer :image_gallerie_id, :null => false
    end
  end
end
