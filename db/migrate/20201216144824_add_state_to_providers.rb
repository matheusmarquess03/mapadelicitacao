class AddStateToProviders < ActiveRecord::Migration[5.2]
  def change
    add_column :providers, :state, :integer
  end
end
