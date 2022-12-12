require "sinatra"
require "sinatra/cookies"

module Chat 
  class App < Sinatra::Base
    helpers Sinatra::Cookies
    #enable :sessions

    p :ok

    get "/" do
      redirect "/login" #if cookies[:name] == nil
      #erb :main, :layout => :layout
    end

    get "/chat" do
      erb :index, :layout => :layout,
          :locals => {
            :teste => "ola mundo", 
            :name => cookies[:name]
          }
    end


  end
end

#Chat::App.new


#############################
  #####  #      #####  #####   
  #      #      #   #    #  
  #      #####  #####    #     
  #      #   #  #   #    #     
  #####  #   #  #   #    #     
                             
#############################
