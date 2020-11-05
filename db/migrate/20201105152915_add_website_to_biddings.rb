class AddWebsiteToBiddings < ActiveRecord::Migration[5.2]
  def change
    add_column :biddings, :website, :string
  end
end
