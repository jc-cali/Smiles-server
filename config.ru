require 'rainbow'
require './models/smile' #require models/smile.rb
require './app' # re quire app.rb

run Sinatra::Application

before '/*' do
  p Rainbow('Request ------').send(:aqua)
  p Rainbow("Host: " request.host + request.path).send(:cyan)
  p Rainbow("Params: " params.to_s).send(:cyan)
end

after '/*' do
  p Rainbow('Response ------').send(:green)
  p Rainbow("Response Body: " + response.body.to_s).send(:yellow)
end
