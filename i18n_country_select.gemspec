$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "i18n_country_select/version"

# encoding: utf-8
Gem::Specification.new do |s|
  s.name         = "i18n_country_select"
  s.version     = I18nCountrySelect::VERSION
  s.authors      = ["Brian McQuay (brian@onomojo.com)"]
  s.email        = "brian@onomojo.com"
  s.homepage     = "https://github.com/onomojo/i18n_country_select"
  s.summary      = "I18n country select helper"
  s.description  = "A simple country code select helper that works with I18n translations. Works exactly the same as country_select but uses country codes instead."

  s.files        = Dir.glob("lib/**/*") + %w(README.rdoc MIT-LICENSE)
  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.rubyforge_project = '[none]'
  s.required_rubygems_version = '>= 1.3.5'
  s.add_dependency('i18n', '~> 0.5')
  s.add_dependency('i18n-country-translations', ">= 0.0.9")
  s.add_dependency('unicode_utils', ">= 1.0.0")
  s.add_development_dependency "rails", ">= 3.0.0"
  s.add_development_dependency "rspec-rails", ">= 2.7.0"
  s.add_development_dependency "spork", "~> 1.0rc"
end
