class EngineSearch
  require 'httparty'

  def search(_query)
    raise 'Implement in concrete class'
  end

  protected

  def parse_search_response(response)
    raise 'Implement in concrete class'
  end
end
