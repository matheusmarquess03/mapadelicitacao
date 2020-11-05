class Bidding < ApplicationRecord

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
end
