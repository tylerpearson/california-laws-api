class SectionsController < ApplicationController
  def index
    @sections = Section.all.limit(500)
    render json: @sections
  end
end
