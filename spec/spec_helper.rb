$:<< File.expand_path('../../lib', __FILE__)

require 'bundler/setup'
require 'pry'
require 'rspec'

require 'mongoid_slug'

Mongoid.configure do |config|
  config.connect_to('mongoid_slug_test')
end

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |c|
  c.before(:each) do
    # Clean database.
    Mongoid.purge!

    # Reload models to avoid side effects.
    Dir["#{File.dirname(__FILE__)}/models/*.rb"].each do |f|
      klass = File.basename(f).split('.').first.capitalize
      Object.send :remove_const, klass if Object.const_defined? klass

      load f
    end
  end
end
