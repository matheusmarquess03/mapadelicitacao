class ChangeDataTypeForService < ActiveRecord::Migration[5.2]
  def change
     change_column(:certificates, :kind_of_service, 'integer USING CAST(column_name AS integer)')
	 rename_column(:certificates, :kind_of_service, :kind_of_service_id)
  end
  
end
