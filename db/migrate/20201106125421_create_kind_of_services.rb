class CreateKindOfServices < ActiveRecord::Migration[5.2]
  def change
    create_table :kind_of_services do |t|
      t.string :name

      t.timestamps
    end
  end
end
