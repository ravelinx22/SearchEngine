class GeneralSearch < EngineSearch
  def search(query)
    google = GoogleSearch.new.search(query)
    bing = BingSearch.new.search(query)
    google + bing
  end
end
