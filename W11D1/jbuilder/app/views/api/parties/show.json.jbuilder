json.extract! @party, :name, :location


# json.array!(@reservations) do |json, reservation|
#     json.restaurant reservation.restaurant.name
#     json.reservation_time reservation.time

#     json.details do 
#         json.address reservation.restaurant.address 
#         json.rating reservation.restaurant.rating 
#     end
# end 

json.array!(@guests) do |guest|
    json.gift guest.gifts, :title
end

# json.guests do |guest|
#     json.array! @party.guests
#         guest.gifts
#         # json.gifts do 
#         #     json.extract! @guests.gifts, :title, :description
#         # end
# end


#only get the guest from one party

#guests belongs to party
#gift belongs to guest


#  json.partial! "api/guests/guest", guest: @guest

#  json.gifts do 
#     json.array! @guest.gifts, :title, :description
#  end






# {
#     "name": "John Doe", 
#     "reservations": [
#         {
#             "restaurant": "ABC",
#             "reservation_time": "2012/12/01 20:00", 
#             "details": {
#                 "address": "somewhere", 
#                 "rating": "5"
#             }
#         }, 
#         {
#             "restaurant": "CDE",
#             "reservation_time": "2012/12/04 20:00", 
#             "details": {
#                 "address": "somewhere else", 
#                 "rating": "3"
#             }
#         }
#     ]
# }