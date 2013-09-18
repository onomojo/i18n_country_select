module I18nCountrySelect
  module InstanceTag
    include Countries

    def to_country_code_select_tag(priority_countries, options = {}, html_options = {})
      country_code_select(priority_countries, options, html_options)
    end

    # Adapted from Rails country_select. Just uses country codes instead of full names.
    def country_code_select(priority_countries, options, html_options)
      selected = object.send(@method_name) if object.respond_to?(@method_name)

      country_translations = country_translations = COUNTRY_CODES.map do |code|
        translation = I18n.t(code, :scope => :countries, :default => 'missing')
        translation == 'missing' ? nil : [translation, code]
      end.compact.sort_by(&:first)

      countries = ""

      if options[:include_blank]
        option = options[:include_blank] == true ? "" : options[:include_blank]
        countries += "<option>#{option}</option>\n"
      end

      if priority_countries
        countries += options_for_select(priority_countries, selected)
        countries += "<option value=\"\" disabled=\"disabled\">-------------</option>\n"
      end

      countries = countries + options_for_select(country_translations, selected)

      html_options = html_options.stringify_keys
      add_default_name_and_id(html_options)

      content_tag(:select, countries.html_safe, html_options)
    end
  end
end