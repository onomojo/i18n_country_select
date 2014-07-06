module I18nCountrySelect
  module FormHelpers
    def country_code_select(object_name, method, priority_countries = nil, options = {}, html_options = {})
      if Rails::VERSION::MAJOR >= 4
        instance_tag = ActionView::Helpers::Tags::Select.new(object_name, method, self, [], options, html_options)
        return instance_tag.to_country_code_select_tag(priority_countries, options, html_options)
     else
       instance_tag = ActionView::Helpers::InstanceTag.new(object_name, method, self, options.delete(:object))
       return instance_tag.to_country_code_select_tag(priority_countries, options, html_options)
     end
    end
  end
end
