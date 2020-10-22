class CreateCertificates < ActiveRecord::Migration[5.2]
  def change
    create_table :certificates do |t|
      t.integer :number
      t.float :value
      t.text :object
      t.string :responsible_enginner
      t.string :work_site
      t.integer :year
      t.string :deadline
      t.datetime :start_date
      t.datetime :end_date
      t.integer :book
      t.string :item
      t.text :description
      t.string :unit
      t.float :quantity
      t.string :kind_of_service
      t.string :path_file
      t.string :company_name

      t.timestamps
    end
  end
end
