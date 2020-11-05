class AddCompanyIdToBiddings < ActiveRecord::Migration[5.2]
  def change
    add_column :biddings, :company_id, :integer
  end
end
