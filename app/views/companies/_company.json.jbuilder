json.extract! company, :id, :name, :cnpj, :image_file_name, :created_at, :updated_at
json.url company_url(company, format: :json)
