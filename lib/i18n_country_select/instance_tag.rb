module I18nCountrySelect
	module InstanceTag
		include Countries
    
		def to_country_code_select_tag(priority_countries, options = {}, html_options = {})
			country_code_select(priority_countries, options, html_options)
		end

		# Adapted from Rails country_select. Just uses country codes instead of full names.
		def country_code_select(priority_countries, options, html_options)
			selected = object.send(@method_name)
      
      country_translations = COUNTRY_CODES.map{|code| [I18n.t(code, :scope => :countries), code]}.sort_alphabetical

			countries = ""
			if priority_countries
				countries += options_for_select(priority_countries, selected)
				countries += "<option value=\"\" disabled=\"disabled\">-------------</option>\n"
      elsif options[:include_blank]
        countries += "<option value=\"\">" + options[:include_blank] + "</options>\n"
				countries += "<option value=\"\" disabled=\"disabled\">-------------</option>\n"
			end

			countries = countries + options_for_select(country_translations, selected)
			
      html_options = html_options.stringify_keys
      add_default_name_and_id(html_options)

      content_tag(:select, countries.html_safe, html_options)
		end
	end
end