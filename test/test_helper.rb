require 'coveralls'
Coveralls.wear!

ENV['RAILS_ENV'] = 'test'
DEVISE_ORM = (ENV['DEVISE_ORM'] || :active_record).to_sym

$LOAD_PATH.unshift File.dirname(__FILE__)
puts "\n==> Devise.orm = #{DEVISE_ORM.inspect}"

require 'dummy/config/environment'
require 'rails/test_help'
require "orm/#{DEVISE_ORM}"

require 'mocha/setup'

ActiveSupport.test_order = :random if ActiveSupport.respond_to?(:test_order)

# Add support to load paths so we can overwrite broken webrat setup
$LOAD_PATH.unshift File.expand_path('../support', __FILE__)
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
