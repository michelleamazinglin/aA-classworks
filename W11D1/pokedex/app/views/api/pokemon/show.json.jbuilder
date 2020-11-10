json.pokemon do
    json.extract! @pokemon, :id, :name, :attack, :defense, :moves, :poke_type, :image_url, :item_ids
end

json.items do # iterate through the items
    @pokemon.items.each do |item| #items doesnt need a controller, can  be accessed through pokemon model association "has_many :items" (rails magic)
        json.set! item.id do #set the item.id(key) to access through .extract!
            json.extract! item, :id, :name, :price, :happiness, :image_url
        end #make sure to use the same variable with .extract! to list the info
    end
end
