module ProvidersHelper
	def providers_states_i18n
		Provider.states.to_a.map { |w| [ I18n.t("enums.providers.state.#{w[0]}"), w[1] ] }
	end
end
