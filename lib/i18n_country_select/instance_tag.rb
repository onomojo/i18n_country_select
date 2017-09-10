module I18nCountrySelect
  module InstanceTag
    def to_country_code_select_tag(priority_countries, html_options = {}, options = {})
      # Rails 4 stores options sent when creating an InstanceTag.
      # Let's use them!
      options = @options if defined?(@options)

      country_code_select(priority_countries, options, html_options)
    end

    # Adapted from Rails country_select. Just uses country codes instead of full names.
    def country_code_select(priority_countries, options, html_options)
      selected = options.fetch(:selected, object.respond_to?(@method_name) ? object.send(@method_name) : nil)

      countries = ""

      if options.present? and options[:include_blank]
        option = options[:include_blank] == true ? "" : options[:include_blank]
        countries += "<option>#{option}</option>\n"
      end

      codes_to_ignore = []
      if priority_countries
        countries += options_for_select(priority_countries, selected)
        countries += "<option value=\"\" disabled=\"disabled\">-------------</option>\n"
        codes_to_ignore = priority_countries.map {|c| c.second.to_sym}
      end

      countries = countries + options_for_select(country_translations(codes_to_ignore), selected)

      html_options = html_options.stringify_keys
      add_default_name_and_id(html_options)

      content_tag(:select, countries.html_safe, html_options)
    end

    def country_translations(codes_to_ignore = [])
      Thread.current[:country_translations] ||= {}
      Thread.current[:country_translations][I18n.locale] ||= begin
        codes = (I18n.t 'countries').keys
        codes -= codes_to_ignore
        codes.map do |code|
          translation = I18n.t(code, :scope => :countries, :default => 'missing')
          translation == 'missing' ? nil : [translation, code]
        end.compact.sort_by do |translation, code|
          normalize_translation(translation)
        end
      end
    end

    private
      def normalize_translation(translation)
        UnicodeUtils.canonical_decomposition(translation).split('').select do |c|
          UnicodeUtils.general_category(c) =~ /Letter|Separator|Punctuation|Number/
        end.join
      end
  end
end