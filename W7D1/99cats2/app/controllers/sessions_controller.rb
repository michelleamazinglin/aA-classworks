class SessionsController < ApplicationController
    def new
        render :new
    end

    def create
        user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:username]
        )

        if user 
            session[:session_token] = user.reset_session_token!
            redirect_to cats_url
        else 
            flash.now[:errors] = ['Invalid password and/or username']   
            render :new
        end
    end

    def destroy
        logout! 
        redirect_to new_session_url
    end
end


#                     Prefix Verb   URI Pattern                                                                              Controller#Action
#                       cats GET    /cats(.:format)                                                                          cats#index
#                            POST   /cats(.:format)                                                                          cats#create
#                    new_cat GET    /cats/new(.:format)                                                                      cats#new
#                   edit_cat GET    /cats/:id/edit(.:format)                                                                 cats#edit
#                        cat GET    /cats/:id(.:format)                                                                      cats#show
#                            PATCH  /cats/:id(.:format)                                                                      cats#update
#                            PUT    /cats/:id(.:format)                                                                      cats#update
# approve_cat_rental_request POST   /cat_rental_requests/:id/approve(.:format)                                               cat_rental_requests#approve
#    deny_cat_rental_request POST   /cat_rental_requests/:id/deny(.:format)                                                  cat_rental_requests#deny
#        cat_rental_requests POST   /cat_rental_requests(.:format)                                                           cat_rental_requests#create
#     new_cat_rental_request GET    /cat_rental_requests/new(.:format)                                                       cat_rental_requests#new
#                      users POST   /users(.:format)                                                                         users#create
#                   new_user GET    /users/new(.:format)                                                                     users#new
#                new_session GET    /session/new(.:format)                                                                   sessions#new
#                    session DELETE /session(.:format)                                                                       sessions#destroy
#                            POST   /session(.:format)                    