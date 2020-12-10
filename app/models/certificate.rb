class Certificate < ApplicationRecord
	belongs_to :kind_of_service

    enum verified: {
        Sim: 1,
        Não: 2
    
    }

	def self.certificate_csv(certificates)
		headers = ['Número', 'Valor', 'Objeto', 'Engenheiro Responsavel', 'Local da Obra', 'Ano', 'Prazo', 'Data de Inicio', 'Data de Término', 'Livro', 'Item', 'Descrição', 'Unidade', 'Quantidade',  'Tipo de Serviço', 'Path do Arquivo', 'Nome da Empresa']
    
    CSV.generate(headers: true, encoding: 'UTF-8', col_sep: ';') do |csv|
      csv << headers

     certificates.each do |certificate|
        csv << [
        	"",#certificate.number,
        	certificate.value,
        	certificate.object,
        	certificate.responsible_enginner,
        	certificate.work_site,
        	certificate.year,
        	certificate.deadline,
        	certificate.start_date,
        	certificate.end_date,
        	certificate.book,
        	certificate.item,
        	certificate.description,
        	certificate.unit,
        	certificate.quantity,
        	certificate.kind_of_service,
        	certificate.path_file,
        	certificate.company_name
        ]
      end
    end
  end


end
