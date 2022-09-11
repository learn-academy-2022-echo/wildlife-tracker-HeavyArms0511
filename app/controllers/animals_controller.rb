class AnimalsController < ApplicationController
    
    
    def render_unprocessable_entity_response(exception)
        render json: exception.record.errors, status: :unprocessable_entity
      end

      def render_not_found_response(exception)
        render json: { error: exception.message }, status: :not_found
      end


    def index
        animals = Animal.all
        render json: animals
    end
    def show
        animal = Animal.find(params[:id])
        render json: animal, include:[:sightings]
    end
    def create
        animal = Animal.create(animal_params)
        if animal.valid?
            render json: animal
        else 
            render json: animal.errors
        end
    end
    def update
        animal = Animal.find(params[:id])
        animal.update!(animal_params)
        if animal.valid?
            render json: animal
        else 
            render json: animal.errors
        end
    end
    def destroy
        animal = Animal.find(params[:id])
        if animal.destroy
            render json: animal
        else 
            render json: animal.errors
        end
    end

    private
    def animal_params
        params.require(:animal).permit(:common_name, :scientific_binomial)
    end
end
