class Bidding < ApplicationRecord

	#Enumerators
	enum status: {
		registered: 1,
		ongoing: 2,
		closed_without_participation: 3,
		closed_with_participation: 4,
		postponed: 5,
		won: 6
	}
	
	ransacker :created_at do
		Arel.sql("date(biddings.created_at)")
	end
end
