require './config/environment'

use Rack::MethodOverride
use UsersController
use PokemonsController
run ApplicationController