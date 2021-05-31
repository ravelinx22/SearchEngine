require 'sinatra/base'
require_relative 'faker'

class BingFaker < Faker
  get '/v7.0/search' do
    json_response(200, 'bing.json')
  end
end
