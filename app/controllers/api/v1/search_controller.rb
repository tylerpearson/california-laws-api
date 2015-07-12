module Api
  module V1
    class SearchController < ApplicationController

      def index
        search_term = params[:search]
        results = []

        if !search_term.nil?
          results = Section.search(search_term)
        end

        results = formatted_results(results)

        render json: results, meta: {
            term: search_term,
            count: results.count
          }
      end

      private

        def formatted_results(results)
          Section.where("id IN (?)", results.map { |section| section['_source']['id'] }).limit(100)
        end

    end
  end
end
