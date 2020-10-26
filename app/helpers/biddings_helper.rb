module BiddingsHelper
	def biddings_statuses_i18n
		Bidding.statuses.to_a.map { |w| [ I18n.t("enums.biddings.status.#{w[0]}"), w[1] ] }
  end
end
