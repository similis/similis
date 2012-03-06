class CreateConsultations < ActiveRecord::Migration
  def new
    create_table :consultations do |t|
      t.string :short_description
      t.integer :customer_id
      t.text :description
      t.date :consultation_date
      t.integer :duration
      t.integer :treatment_id
      t.integer :treatment_success

      t.timestamps
    end
  end
end
