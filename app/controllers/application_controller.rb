class ApplicationController < Sinatra::Base

    configure do
        set(:views, 'app/views')
        enable :sessions
        set :session_secret, 'secret'
    end

    get '/' do
        erb :welcome 
    end

    helpers do

        def current_user
            @user = User.find_by(id: session[:user_id])
        end

        def redirect_if_not_logged_in
            # redirect '/login' unless current_user
        end

        def check_owner(obj)
            obj && obj.user == current_user
        end

        def redirect_if_not_owner(obj)
            if !check_owner(obj)
                redirect '/pokemons'
            end
        end

        def set_pokemon
            @pokemon = Pokemon.find_by(id: params[:id])
        end
    end
    
end