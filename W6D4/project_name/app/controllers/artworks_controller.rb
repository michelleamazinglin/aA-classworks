class ArtworksController < ApplicationController
   def index
        
        user = User.find(params[:user_id])
        render json: user.artworks #this is refering to the assoication we created
   end

   def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
          render json: artwork
        else
          render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
   end

   def show
        artwork = Artwork.find(params[:id])  
        render json: artwork
   end

   def destroy
        artwork = Artwork.find(params[:id])
        artwork.destroy
        render json: artwork
   end

   def update
        artwork = Artwork.find(params[:id])
        if artwork.update(artwork_params)
          render json: artwork
        else
          render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
   end

     # private
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
    # require looks for top level key of `artwork` within params
    # then only grabs (permits) the keys within drop of name and email
  end 
end