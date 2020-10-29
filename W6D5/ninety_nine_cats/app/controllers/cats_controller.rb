class CatsController < ApplicationController
#class DropsController < ApplicationController
    def index
        @cats = Cat.all
        render :index
    end

    def create
        cat = Cat.new(cat_params)
        if cat.save
            redirect_to cat_url(cat)
        else
            render json: cat.errors.full_messages, status: 422
        end
    end

    def new
        @cat = Cat.new
        render :new
    end

    def edit
        
    end

    def show
        @cat = Cat.find(params[:id]) # instance variable accessible in our view
        render :show
    end

    def update

    end

    def destroy
    end

    #private
    def cat_params
        params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
    end
end
