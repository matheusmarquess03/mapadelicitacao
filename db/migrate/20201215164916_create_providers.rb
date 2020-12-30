class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string :unity
      t.float :value
      t.string :company
      t.string :adress
      t.string :state
      t.string :phone
      t.string :email
      t.string :website
      t.string :contact
      t.text :remark

      t.timestamps
    end
  end
end
