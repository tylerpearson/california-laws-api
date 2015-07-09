class CodesController < ApplicationController
  def index
    @codes = Code.all

    render json: @codes
  end
end
