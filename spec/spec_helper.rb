ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"
require "capybara/rails"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

Capybara.configure do |config|
  config.javascript_driver = :webkit
  config.match = :prefer_exact
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Requests::JsonHelpers, :type => :request

  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
end
