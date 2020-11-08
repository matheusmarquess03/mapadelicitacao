class AddValueabbrToBiddings < ActiveRecord::Migration[5.2]
  def change
    add_column :biddings, :value_abbr, :string
  end
end
