class UsersController < ApplicationController

    get '/signup' do
        if session[:user_id]
            redirect "/users/#{session[:user_id]}"
        end
        erb :'users/signup'
    end
end