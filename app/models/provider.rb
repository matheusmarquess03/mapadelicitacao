class Provider < ApplicationRecord
	enum state: {
		AC: 1, 
		AL: 2,
		AP: 3, 
		AM: 4,
		BA: 5,
		CE: 6,
		DF: 7, 
		ES: 8,
		GO: 9,
		MA: 10,
		MT: 11, 
		MS: 12,  
		MG: 13, 
		PA: 14, 
		PB: 15, 
		PR: 16,
		PE: 17, 
		PI: 18, 
		RJ: 19, 
		RN: 20, 
		RS: 21, 
		RO: 22, 
		RR: 23, 
		SC: 24, 
		SP: 25,
		SE: 26,
		TO: 27
	}

	def self.provider_csv(provider)
		 headers = ['Data da Cotação', 'Descriçao', 'Unidade', 'Valor', 'Empresa', 'Endereço', 'Estado', 'Telefone', 'Email', 'Website', 'Contato', 'Observação']
    
    CSV.generate(headers: true, encoding: 'UTF-8', col_sep: ';') do |csv|
      csv << headers
	  

      provider.each do |provider|
      

        csv << [
	          provider.quotation_date,     
	          provider.description,     
	          provider.unity,
	          provider.value, 
	          provider.company,
	          provider.adress,
	          provider.state, 
	          provider.phone, 
	          provider.email, 
	          provider.website, 
	          provider.contact, 
	          provider.remark 
              ]       
      end
    end
  end

end


