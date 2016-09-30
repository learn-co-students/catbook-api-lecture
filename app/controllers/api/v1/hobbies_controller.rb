module Api
  module V1
    class HobbiesController < ApplicationController

      def index
        render json: Hobby.all
      end
    end
  end
end