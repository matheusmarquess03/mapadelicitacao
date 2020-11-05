class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :cnpj
      t.string :image_file_name

      t.timestamps
    end
  end
end
