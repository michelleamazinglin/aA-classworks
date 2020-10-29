class ArtworkSharesController < ApplicationController
#    def index
#         artworkshares = Artwork.all
#         render json: artworks
#    end

   def create
        artworkshare = ArtworkShare.new(artwork_share_params)
        if artworkshare.save
          render json: artworkshare
        else
          render json: artworkshare.errors.full_messages, status: :unprocessable_entity
        end
   end

   def destroy
        artworkshare = ArtworkShare.find(params[:id])
        artworkshare.destroy
        render json: artworkshare
   end


     # private
  def artwork_share_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    # require looks for top level key of `artworkshares` within params
    # then only grabs (permits) the keys within drop of name and email
  end 
end