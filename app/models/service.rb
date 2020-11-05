class Service < ApplicationRecord
	enum status: {
		Coleta: 1,
		Drenagem: 2,
		Drenagem_e_Pavimentação: 3,
		Obra_de_Revitalização: 4,
		Outros: 5

	}

	ransacker :created_at do
		Arel.sql("date(biddings.created_at)")
	end
end
