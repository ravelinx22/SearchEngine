module Helper
  module Json
    def json
      @json ||= JSON.parse(response.body)
      @json
    end

    def json!
      @json = JSON.parse(response.body)
    end
  end
end
