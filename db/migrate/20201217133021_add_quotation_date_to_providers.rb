class AddQuotationDateToProviders < ActiveRecord::Migration[5.2]
  def change
    add_column :providers, :quotation_date, :date
  end
end
