require 'sinatra/base'

class Faker < Sinatra::Base
  protected

  def json_response(response_code, fixtures_file_name)
    content_type :json
    status response_code

    File.open(
      "#{File.dirname(__FILE__)}/../fixtures/#{fixtures_file_name}"
    ).read
  end
end
