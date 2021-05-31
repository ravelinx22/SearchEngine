class EngineController < ApplicationController
  def search
    if search_params[:engine] == 'google'
      render json: GoogleSearch.new.search(search_params[:q])
    elsif search_params[:engine] == 'bing'
      render json: BingSearch.new.search(search_params[:q])
    elsif search_params[:engine] == 'both'
      render json: { buenas: 'both' }
    else
      raise 'Not supported'
    end
  end

  private

  def search_params
    params.permit(:engine, :q)
  end
end
