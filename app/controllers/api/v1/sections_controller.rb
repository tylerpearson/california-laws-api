module Api
  module V1
    class SectionsController < ApplicationController
      def index
        @sections = Section.all.limit(100)
        render json: @sections
      end
    end
  end
end
