class Api::PokemonController < ApplicationController

    def index
        @pokemon = Pokemon.all
        render :index ##json
    end

    def show
        @pokemon = Pokemon.find(params[:id])
    end
end