class PokemonsController < ApplicationController

    get '/pokemons' do
        redirect_if_not_logged_in
        @pokemons = Pokemon.all 
        erb :'pokemons/index'
    end

    get '/pokemons/new' do
        redirect_if_not_logged_in
        erb :'pokemons/new'
    end

    post '/pokemons' do
        redirect_if_not_logged_in

        pokemon = current_user.pokemons.create(params[:pokemon])
        if pokemon.valid?
            redirect "pokemons/#{pokemon.id}"
        else
            redirect '/pokemons/new'
        end
    end

    get '/pokemons/:id' do
        redirect_if_not_logged_in
        set_pokemon
        if !@pokemon
            redirect '/pokemons'
        end
        erb :'pokemons/show'
    end

    get '/pokemons/:id/edit' do
        redirect_if_not_logged_in
        set_pokemon
        redirect_if_not_owner(@pokemon)
        erb :'pokemons/edit'
    end

    patch '/pokemons/:id' do
        redirect_if_not_logged_in
        set_pokemon
        if check_owner(@pokemon)
            @pokemon.update(params[:pokemon])
        end
        erb :'pokemons/show'
    end

    delete '/pokemons/:id' do
        redirect_if_not_logged_in
        set_pokemon
        if check_owner(@pokemon)
            @pokemon.delete
            redirect('/pokemons')
        else
            erb :'items/show'
        end
    end
end