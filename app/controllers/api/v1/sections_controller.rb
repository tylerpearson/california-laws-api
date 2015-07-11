module Api
  module V1
    class SectionsController < ApplicationController

      def show
        @section = Section.find_by_id(params[:id])
        render json: @section
      end

      def index
        @sections = Section.page(params[:page])
        render json: @sections, meta: {
          current_page: @sections.current_page,
          next_page: @sections.next_page,
          prev_page: @sections.prev_page,
          total_pages: @sections.total_pages,
          total_count: @sections.total_count
        }
      end

    end
  end
end
