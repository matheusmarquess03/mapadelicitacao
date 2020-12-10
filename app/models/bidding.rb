class Bidding < ApplicationRecord

	belongs_to :kind_of_service
	belongs_to :company

	has_many_attached :uploads
	
	#Enumerators
	enum status: {
		registered: 1,
		ongoing: 2,
		closed_without_participation: 3,
		closed_with_participation: 4,
		postponed: 5,
		won: 6,
		bidding_map: 7,
		missing_certificate: 8
	}

	enum type_of_certificate: {
		professional: 1,
		company: 2,
		both: 3
	}


	
	ransacker :created_at do
		Arel.sql("date(biddings.created_at)")
	end

	def self.bidding_csv(biddings)
		 headers = ['Data da Licitação', 'Órgão', 'Modalidade', 'Objeto', 'Valor Abreviado', 'Valor Edital', 'Vistoria', 'Orçamento', 'Atestados', 'Status', 'Data de Prospecção', 'Tipo de Atestado', 'Tipo de Serviço', 'Empresa']
    
    CSV.generate(headers: true, encoding: 'UTF-8', col_sep: ';') do |csv|
      csv << headers
	  

      biddings.each do |bidding|
      

        csv << [
        	bidding.date,
        	bidding.organ,
        	bidding.modality,
        	bidding.object,
        	bidding.value_abbr,
        	bidding.value,
        	bidding.inspection,
        	bidding.budge,
        	bidding.remark,
        	I18n.t("enums.biddings.status.#{bidding.status}"),
        	bidding.created_at,
        	I18n.t("enums.biddings.type_of_certificate.#{bidding.type_of_certificate}"),
        	bidding.kind_of_service.name,
        	bidding.company.name
        	]        
      end
    end
  end


def self.prospection_csv(biddings)
	headers = ['Data da Licitação', 'Órgão', 'Modalidade', 'Objeto', 'Valor Abreviado', 'Valor Edital', 'Vistoria', 'Orçamento', 'Atestados', 'Status', 'Data de Prospecção', 'Tipo de Atestado', 'Tipo de Serviço', 'Empresa']
    
    CSV.generate(headers: true, encoding: 'UTF-8', col_sep: ';') do |csv|
      
      csv << headers

     biddings.each do |prospection|
        csv << [
        	bidding.date,
        	bidding.organ,
        	bidding.modality,
        	bidding.object,
        	bidding.value_abbr,
        	bidding.value,
        	bidding.inspection,
        	bidding.budge,
        	bidding.remark,
        	I18n.t("enums.biddings.status.#{bidding.status}"),
        	bidding.created_at,
        	I18n.t("enums.biddings.type_of_certificate.#{bidding.type_of_certificate}"),
        	bidding.kind_of_service.name,
        	bidding.company.name
        	]        
      end
    end
  end






def self.import(file)
	CSV.foreach(file.path, headers: true) do |row|
		biddings_hash = row.to_hash
		biddings =  find_or_create_by! 
		biddings.update_attributes(biddings_hash)
		end
	end		
end
