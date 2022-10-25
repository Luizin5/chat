require "sinatra"

module Chat 
  class App < Sinatra::Base
    p :ok

    enable :sessions

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
