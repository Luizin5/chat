module Chat
  class App < Sinatra::Base

     get "/login" do
      erb :login, :layout => :layout
    end

    post "/login" do
      session["name"] = params[:name]
      redirect "/chat"
    end

  end
end
