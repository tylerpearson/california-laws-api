module Api
  module V1
    class SectionsController < ApplicationController

      def show
        @section = Section.find_by_id(params[:id])
        render json: @section
      end

      def index
        @sections = Section.where(nil)

        filter_params(params).each do |key, value|
          @sections = @sections.public_send(key, value) if value.present?
        end

        @sections = @sections.page(params[:page])

        render json: @sections, meta: {
          current_page: @sections.current_page,
          next_page: @sections.next_page,
          prev_page: @sections.prev_page,
          total_pages: @sections.total_pages,
          total_count: @sections.total_count
        }
      end

      private

        def filter_params(params)
          params.slice(:code, :division, :chapter, :article)
        end

    end

  end
end
