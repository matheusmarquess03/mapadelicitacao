class AddHasCertificateToBiddings < ActiveRecord::Migration[5.2]
  def change
    add_column :biddings, :has_certificate, :integer
  end
end
