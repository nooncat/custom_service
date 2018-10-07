ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'

DatabaseCleaner.clean_with :truncation
Rails.application.load_seed

require 'rails/test_help'
Dir[Rails.root.join('test/support/**/*.rb')].each { |f| require f }

class ActiveSupport::TestCase
  include Support::Auth

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...
end
