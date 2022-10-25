require "em-websocket"

module Chat
  class Server
    include EM
    include EventMachine

    def initialize; @clients = []; end

    def start
      p :ok
      EventMachine.run do
        EM::WebSocket.start(
          :host => "0.0.0.0",
          :port =>"1200") do |ws|
  
          # adicionar o usuario á lista de usuarios #
          ws.onopen do |j|
            puts "entrou"
            @clients << ws
          end

          # enviar a mensagem para todos os clients #
          ws.onmessage do |msg|
            @clients.each { |client| client.send(msg) } 
          end
        end #EM::WebSocket

      end #EventMachine.run
    end #def start
  end #class Server
end #module Chat

#Chat::Server.new.start
