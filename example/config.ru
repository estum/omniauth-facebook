require 'bundler/setup'
require 'omniauth-facebook'
require './app.rb'

use Rack::Session::Cookie, :secret => 'abc123'

use OmniAuth::Builder do
  provider :facebook, ENV['APP_ID'], ENV['APP_SECRET'], :scope => 'email,read_stream', :auto_exchange_short_lived_tokens => true
end

run Sinatra::Application
