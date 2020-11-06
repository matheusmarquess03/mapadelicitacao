class AddKindOfServiceIdToBiddings < ActiveRecord::Migration[5.2]
  def change
    add_column :biddings, :kind_of_service_id, :integer
  end
end
