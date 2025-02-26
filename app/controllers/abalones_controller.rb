class AbalonesController < ApplicationController
  before_action :doorkeeper_authorize!, except: [:index, :show]
  before_action :set_abalone, only: [:show, :update, :destroy]

  # GET /abalones - List all abalones (Paginated)
  def index
    abalones = Abalone.page(params[:page]).per(20)
    render json: {
      abalones: abalones,
      meta: {
        current_page: abalones.current_page,
        total_pages: abalones.total_pages,
        total_count: abalones.total_count
      }
    }, status: :ok
  end

  # GET /abalones/:id - Show a single abalone
  def show
    render json: @abalone, status: :ok
  end

  # PUT /abalones/:id - Update an abalone
  def update
    if @abalone.update(abalone_params)
      render json: { message: "Abalone updated successfully", abalone: @abalone }, status: :ok
    else
      render json: { error: "Failed to update abalone", details: @abalone.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # POST /abalones - Create a new abalone
  def create
    abalone = Abalone.new(abalone_params)
    if abalone.save
      render json: { message: "Abalone created successfully", abalone: abalone }, status: :created
    else
      render json: { error: "Failed to create abalone", details: abalone.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /abalones/:id - Delete an abalone
  def destroy
    if @abalone.destroy
      render json: { message: "Abalone deleted successfully" }, status: :ok
    else
      render json: { error: "Failed to delete abalone" }, status: :unprocessable_entity
    end
  end

  private

  # Find the abalone record before performing actions
  def set_abalone
    @abalone = Abalone.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Abalone not found" }, status: :not_found
  end

  # Strong parameters
  def abalone_params
    params.require(:abalone).permit(:sex, :length, :diameter, :height, :whole_weight, 
                                    :shucked_weight, :viscera_weight, :shell_weight, :rings)
  end
end
