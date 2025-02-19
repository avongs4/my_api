class AbalonesController < ApplicationController
    def index
      abalones = Abalone.page(params[:page]).per(20)
      render json: {
        abalones: abalones,
        meta: {
          current_page: abalones.current_page,
          total_pages: abalones.total_pages,
          total_count: abalones.total_count
        }
      }
    end
  end
  