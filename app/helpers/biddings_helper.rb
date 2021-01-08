module BiddingsHelper
	def biddings_statuses_i18n
		Bidding.statuses.to_a.map { |w| [ I18n.t("enums.biddings.status.#{w[0]}"), w[1] ] }
	end
  
	def biddings_type_of_certificates_i18n
		Bidding.type_of_certificates.to_a.map { |w| [ I18n.t("enums.biddings.type_of_certificate.#{w[0]}"), w[1] ] }
	end

	def biddings_has_certificates_i18n
		Bidding.has_certificates.to_a.map { |w| [ I18n.t("enums.biddings.has_certificate.#{w[0]}"), w[1] ] }
	end
end
