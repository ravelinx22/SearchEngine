class EngineSearch
  require 'httparty'

  def self.find_engine(engine)
    case engine
    when 'google'
      GoogleSearch.new
    when 'bing'
      BingSearch.new
    when 'both'
      GeneralSearch.new
    else
      raise 'Engine not supported'
    end
  end

  def search(_query)
    raise 'Implement in concrete class'
  end

  protected

  def parse_search_response(_response)
    raise 'Implement in concrete class'
  end
end
