class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :dob
      t.string :email
      t.string :blood_group
      t.string :test_date
      t.string :result
      t.text :inference_from_test
      t.string :staff_that_took_test

      t.timestamps
    end
  end
end
