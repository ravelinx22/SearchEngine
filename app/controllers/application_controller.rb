class ApplicationController < ActionController::Base
  rescue_from StandardError do |e|
    respond(:forbidden, e.message)
  end

  def respond(status, message)
    render json: { mssg: message }, status: status
  end
end
