module Api
    module V1
      class AnimalsController < ApplicationController
        before_action :set_animal, only: [:show, :update, :destroy]
  
        # GET /api/v1/animals
        def index
          animals = Animal.paginate(page: params[:page], per_page: 20)
          render json: {
            animals: animals,
            pagination: {
              current_page: animals.current_page,
              total_pages: animals.total_pages,
              total_entries: animals.total_entries
            }
          }
        end
  
        # GET /api/v1/animals/:id
        def show
          render json: @animal
        end
  
        # POST /api/v1/animals
        def create
          @animal = Animal.new(animal_params)
          if @animal.save
            render json: @animal, status: :created
          else
            render json: @animal.errors, status: :unprocessable_entity
          end
        end
  
        # PATCH/PUT /api/v1/animals/:id
        # def update
        #   if @animal.update(animal_params)
        #     render json: @animal
        #   else
        #     render json: @animal.errors, status: :unprocessable_entity
        #   end
        # end

        def update
          if @animal.update(animal_params)
            render json: { message: "Animal updated successfully", animal: @animal }, status: :ok
          else
            render json: { error: @animal.errors.full_messages }, status: :unprocessable_entity
          end
        end
        









  
        # DELETE /api/v1/animals/:id
        def destroy
          @animal.destroy
        end
  
        private
  
        # def set_animal
        #   @animal = Animal.find(params[:id])
        # rescue ActiveRecord::RecordNotFound
        #   render json: { error: "Animal not found" }, status: :not_found
        # end



        def set_animal
          @animal = Animal.find_by(id: params[:id])
          render json: { error: "Animal not found" }, status: :not_found unless @animal
        end
        

  
        def animal_params
          params.require(:animal).permit(:sex, :length, :diameter, :height, :whole_weight, :shucked_weight, :viscera_weight, :shell_weight, :rings)
        end
      end
    end
  end
  