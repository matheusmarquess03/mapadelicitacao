module CertificatesHelper
	def certificates_verified_i18n
		Certificate.verifieds.to_a.map { |w| [ I18n.t("enums.certificates.verified.#{w[0]}"), w[1] ] }
	end
end
