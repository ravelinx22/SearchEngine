class BingSearch < EngineSearch
  API_KEY = Rails.application.credentials[:bing_key]
  BASE_URL = 'https://api.bing.microsoft.com/v7.0/search'.freeze

  def search(query)
    params = { q: query }
    headers = { 'Ocp-Apim-Subscription-Key': API_KEY }
    response = HTTParty.get(
      BASE_URL, query: params, headers: headers
    )
    parse_search_response(JSON.parse(response.body))
  end

  protected

  def parse_search_response(response)
    pages = response['webPages'] || {}
    items = pages['value']
    raise 'Invalid search' if items.nil?

    items.map do |item|
      {
        title: item['name'],
        url: item['url'],
        description: item['snippet']
      }
    end
  end
end
