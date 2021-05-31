class EngineController < ApplicationController
  def search
    render json: {
      results: EngineSearch.find_engine(
        search_params[:engine]
      ).search(search_params[:q])
    }
  end

  private

  def search_params
    params.permit(:engine, :q)
  end
end
