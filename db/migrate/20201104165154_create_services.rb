class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :kinf_of_service

      t.timestamps
    end
  end
end
