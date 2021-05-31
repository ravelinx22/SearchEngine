require 'sinatra/base'

class GoogleFaker < Faker
  get '/customsearch/v1' do
    json_response(200, 'google.json')
  end
end
