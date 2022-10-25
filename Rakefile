require_relative "server"
require_relative "app"
require_relative "src/login/login"

task :run do 
  include Chat

  s = Thread.new {
    Chat::App.run!
  }
  c = Thread.new {
    Chat::Server.new.start
  }
  s.join
  c.join
end
