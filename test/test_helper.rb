ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'test/unit/rails/test_help'
require 'groonga_client_model/test_helper'

class ActiveSupport::TestCase
  # Add more helper methods to be used by all tests here...
  include FactoryGirl::Syntax::Methods
  include GroongaClientModel::TestHelper
end
