module ServicesHelper
	def services_statuses_i18n
		Service.statuses.to_a.map { |w| [ I18n.t("enums.services.status.#{w[0]}"), w[1] ] }
  end
end
