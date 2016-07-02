ENV["RAILS_ENV"] ||= 'test'

require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'database_cleaner'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|

 config.include ApplicationHelper
 config.use_transactional_fixtures = false
 config.infer_spec_type_from_file_location!

 config.before(:suite) do
   DatabaseCleaner.clean_with(:truncation)
 end

 config.before(:each) do |example|
   DatabaseCleaner.strategy = example.metadata[:js] ? :deletion : :transaction
   DatabaseCleaner.start
 end

 config.before(:each, :integration => true) do
   DatabaseCleaner.strategy = :truncation
 end

 config.after(:each) do
  #  Capybara.reset_sessions!
   DatabaseCleaner.clean
 end

end
