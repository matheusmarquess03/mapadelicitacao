class AddTypeOfCertificateToBiddings < ActiveRecord::Migration[5.2]
  def change
    add_column :biddings, :type_of_certificate, :integer
  end
end
