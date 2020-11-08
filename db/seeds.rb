# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create a default trucker user ===================================================================================
	puts 'CRIANDO EMPRESAS'
	company_list = [
	  [ "OUTROS", "", "" ],
	  [ "TERRAPLENO", "29.167.442/0001-09", "logo_terrapleno.jpg" ],
	  [ "SELLIX", "04.655.182/0001-90", "logo_sellix.jpg" ]
	]

	company_list.each do |name, cnpj, imageName|
		Company.create(:name => name, :cnpj => cnpj, :image_file_name => imageName)
	end
	
	puts 'CRIANDO TIPOS DE SERVIÇO'
	services_list = [
	  "COLETA",
	  "DRENAGEM",
	  "PAVIMENTAÇÃO" ,
	  "PAVIMENTAÇÃO E DRENAGEM" ,
	  "REDE DE ESGOTO",
	  "REDE DE ÁGUA",
	  "OBRAS DE REVISTALIZAÇÃO",
	  "OUTROS"
	]

	services_list.each do |name|
		KindOfService.create(:name => name)
	end