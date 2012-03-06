class CreateMiasmicTypes < ActiveRecord::Migration
  def change
    create_table :miasmic_types do |t|
      t.string :typename
    end
  end
end
