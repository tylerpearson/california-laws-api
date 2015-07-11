class Api::BaseController < ApplicationController

  def index
    render json: { info: "Information on the API is available at http://github.com/tylerpearson/california-laws-api" }
  end

end
