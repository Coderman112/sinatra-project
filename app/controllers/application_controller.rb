class ApplicationController < Sinatra::Base

    get '/' do
        erb :welcome 
    end
    
end