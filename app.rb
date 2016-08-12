require 'bundler'
Bundler.require

happy_thoughts = Smile.new
happy_thoughts.add_smile("everyone's smiling faces")
happy_thoughts.add_smile("coffee was full")
happy_thoughts.add_smile("victims aplenty")

before '/*' do
  puts Rainbow('Request ------').send(:aqua)
  puts Rainbow("Host: " + request.host + request.path).send(:cyan)
  puts Rainbow("Params: " + params.to_s).send(:cyan)
end

after '/*' do
  puts Rainbow('Response ------').send(:green)
  puts Rainbow("Response Body: " + response.body.to_s).send(:yellow)
end

get '/' do
  {
    :name => "indigo montoya",
    :purpose => 'avenge my father',
    :quote => 'prepare to die'
  }.to_json
end

get '/smiles' do
  { :happy_thoughts => happy_thoughts.get_smiles }.to_json
end

get '/smiles/:keyword' do
  @query = params[:keyword]
  @list = happy_thoughts.find_smile(@query)
  { :search_results => @list }.to_json
end
