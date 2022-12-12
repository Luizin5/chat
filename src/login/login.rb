module Chat
  class App < Sinatra::Base

     get "/login" do
      erb :login, :layout => :layout
    end

    post "/login" do
      cookies[:name] = params[:name]
      redirect "/chat"
    end

  end
end
