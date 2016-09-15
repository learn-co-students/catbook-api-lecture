module Api
  module V1
    class CatsController < ApplicationController
      def index
        # all_cats = Cat.all.collect do |cat|
        #   {id: cat.id, name: cat.name, breed: cat.breed, temperament: cat.temperament,
        #     weight: cat.weight, fluffy: cat.fluffy, fat: cat.fat?, hobbies: cat.hobbies}
        # end
        render json: Cat.all
      end

      def show
        render json: Cat.find(params[:id])
      end

      def create
        cat = Cat.new(cat_params)
        if cat.save
          render json: cat
        else
          render json: cat.errors, status: 500
        end
      end

      def update
        cat = Cat.find(params[:id])
        if cat.update(cat_params)
          render json: cat
        else
          render json: cat.errors, status: 500
        end
      end

      def destroy
        cat = Cat.find_by(id: params[:id])
        if cat
          cat.destroy
          head :ok
        else
          render json: {"error" => "cat with id of #{params[:id]} not found"}, status: 404
        end
      end

      private

        def cat_params
          params.require(:cat).permit(:name, :breed, :temperament, :weight)
        end
    end
  end
end

# Api::V1::CatsController