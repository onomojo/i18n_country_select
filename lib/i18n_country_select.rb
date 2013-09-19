require 'unicode_utils/canonical_decomposition'
require 'unicode_utils/general_category'

require "i18n-country-translations"
require "i18n_country_select/countries"
require "i18n_country_select/form_builder"
require "i18n_country_select/form_helpers"
require "i18n_country_select/instance_tag"

ActionView::Base.send(:include, I18nCountrySelect::FormHelpers)
ActionView::Helpers::InstanceTag.send(:include, I18nCountrySelect::InstanceTag)
ActionView::Helpers::FormBuilder.send(:include, I18nCountrySelect::FormBuilder)
