# json.extract! @guest, :name, :age, :favorite_color

 json.partial! "api/guests/guest", guest: @guest

 json.gifts do 
    json.array! @guest.gifts, :title, :description
 end

#key of gift (json.gifts)

# json.partial! "api/drops/drop", drop: @drop

#gifts is nested under guests
# guests.each do |guest| => gifts under each guest

# api_guest_gifts GET  /api/guests/:guest_id/gifts(.:format) api/gifts#index {:format=>:json}