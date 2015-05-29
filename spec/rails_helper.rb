# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'database_cleaner'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'factory_girl'
require 'simplecov'
require 'support/controller_macros'

SimpleCov.start

RSpec.configure do |config|
  config.render_views = true
  config.infer_spec_type_from_file_location!
  FactoryGirl.find_definitions
  config.include FactoryGirl::Syntax::Methods
  config.extend ControllerMacros, type: :controller

  config.before(:suite) do
    DatabaseCleaner[:mongoid].strategy = :truncation
    DatabaseCleaner[:mongoid].clean_with :truncation
  end

  config.around(:each) do |text|
    DatabaseCleaner.cleaning do
      text.run
    end
  end
end
