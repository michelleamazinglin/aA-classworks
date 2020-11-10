@pokemon.each do |poke| #iterate over each pokemon
    json.set! poke.id do #each pokemon => poke | set the poke id
      json.extract! poke, :id, :name  #extract the id and name of each poke
      json.image_url asset_path("pokemon_snaps/#{poke.image_url}") #Asset locations can be different in production so you should always use asset_path rather than a literal path
    end #https://guides.rubyonrails.org/asset_pipeline.html <= asset path doc
  end
