module Api
  module V1
    class CodesController < ApplicationController
      def index
        @codes = Code.all
        render json: @codes
      end
    end
  end
end
