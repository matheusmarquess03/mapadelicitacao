class CreateBiddings < ActiveRecord::Migration[5.2]
  def change
    create_table :biddings do |t|
      t.string :date
      t.string :organ
      t.string :modality
      t.string :object
      t.float :value
      t.string :inspection
      t.string :budge
      t.text :remark
      t.string :status

      t.timestamps
    end
  end
end
