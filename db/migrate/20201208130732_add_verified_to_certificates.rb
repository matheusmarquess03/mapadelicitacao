class AddVerifiedToCertificates < ActiveRecord::Migration[5.2]
  def change
    add_column :certificates, :verified, :integer
  end
end
