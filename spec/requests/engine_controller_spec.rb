require 'rails_helper'

RSpec.describe EngineController, type: :request do
  describe '#search' do
    it 'should search on google' do
      get '/engine/search', params: {
        engine: 'google', q: 'test'
      }

      expect(response.status).to eq(200)
      expect(json['results']).not_to be_nil
      expect(json['results'].count).to be > 0
      expect(json['results'][0]).to have_key('title')
      expect(json['results'][0]).to have_key('url')
      expect(json['results'][0]).to have_key('description')
    end

    it 'should search on bing' do
      get '/engine/search', params: {
        engine: 'bing', q: 'test'
      }

      expect(response.status).to eq(200)
      expect(json['results']).not_to be_nil
      expect(json['results'].count).to be > 0
      expect(json['results'][0]).to have_key('title')
      expect(json['results'][0]).to have_key('url')
      expect(json['results'][0]).to have_key('description')
    end

    it 'should search on both google and bing' do
      get '/engine/search', params: {
        engine: 'both', q: 'test'
      }

      expect(response.status).to eq(200)
      expect(json['results']).not_to be_nil
      expect(json['results'].count).to be > 0
      expect(json['results'][0]).to have_key('title')
      expect(json['results'][0]).to have_key('url')
      expect(json['results'][0]).to have_key('description')
    end

    it 'should not search on an invalid engine' do
      get '/engine/search', params: {
        engine: 'invalid', q: 'test'
      }

      expect(response.status).to eq(403)
      expect(json['mssg']).not_to be_nil
    end
  end
end
