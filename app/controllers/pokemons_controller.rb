class PokemonsController < ApplicationController

    get '/pokemons' do
        redirect_if_not_logged_in
        @pokemons = Pokemon.all 
        erb :'pokemons/index'
    end
end