class AddReasonToBiddings < ActiveRecord::Migration[5.2]
  def change
    add_column :biddings, :reason, :text
  end
end
