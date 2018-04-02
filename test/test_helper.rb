ENV["RAILS_ENV"] ||= "test"
require File.expand_path("config/environment", __dir__)
require "rails/test_help"

class ActiveSupport
  class TestCase
    fixtures :all
  end

  # Add more helper methods to be used by all tests here...
end
