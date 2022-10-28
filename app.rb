require "sinatra"
#require "sinatra/cookies"

module Chat 
  class App < Sinatra::Base
    #helpers Sinatra::Cookies
    enable :sessions

    p :ok

    get "/" do
      redirect "/login"
    end

    get "/chat" do
      erb :index, :layout => :layout, 
          :locals => {
            :teste => "ola mundo", 
            :name => session["name"]
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
