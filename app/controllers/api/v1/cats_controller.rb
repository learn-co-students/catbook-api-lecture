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
    end
  end
end

# Api::V1::CatsController