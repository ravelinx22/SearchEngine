class GoogleSearch < EngineSearch
  API_KEY = Rails.application.credentials[:google_key]
  DEFAULT_CX = Rails.application.credentials[:google_cx]
  BASE_URL = 'https://www.googleapis.com/customsearch/v1?'.freeze

  def search(query)
    params = { q: query, key: API_KEY, cx: DEFAULT_CX }
    response = HTTParty.get(BASE_URL, query: params)
    parse_search_response(JSON.parse(response.body))
  end

  protected

  def parse_search_response(response)
    items = response['items']
    raise 'Invalid search' if items.nil?

    items.map do |item|
      {
        title: item['title'],
        url: item['link'],
        description: item['snippet']
      }
    end
  end
end
