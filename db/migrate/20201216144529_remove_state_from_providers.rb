class RemoveStateFromProviders < ActiveRecord::Migration[5.2]
  def change
    remove_column :providers, :state, :string
  end
end
