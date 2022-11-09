require_relative "db/dbconnect"
require "em-websocket"

module Chat
  class Server
    include EM
    include EventMachine

    def initialize
      @clients = []
      @db = DBconn::Connect.new("db/base.db")
      #conecta ao banco de dados
    end

    def scope
      yield
    end

    def start
      p :ok
      EventMachine.run do
        EM::WebSocket.start(
          :host => "0.0.0.0",
          :port =>"1200") do |ws|
          # adicionar o usuario á lista de usuarios #
          ws.onopen do 
            puts "entrou"
            @clients << ws
            
            # pega todos os nick e mensagens do
            # banco de dados
            msgs = @db.exec("select * from messages")
            @clients.each_with_index { |c| 
              msgs.each do |i|
                #p i[:nick]
                c.send("#{i[:nick]} : #{i[:msg]}".force_encoding('UTF-8')) 
                #envia a mensagem para todos os clients
              end
            }
          end



          # enviar a mensagem para todos os clients #
          ws.onmessage do |msg|
            #separa o nick e o conteudo da mensagem
            nick,msg = msg.split(":")
            #############
            # teste:    #
            # p nick,msg#
            #############
            @db.exec("insert into messages values(\"#{nick}\",\"#{msg}\") ")

            @clients.each { |client| client.send("#{nick}: #{msg}".force_encoding('UTF-8') ) }
            #envia a mensagem e o nick para todos os clients

          end


        end #EM::WebSocket
      end #EventMachine.run
    end #def start
  end #class Server
end #module Chat

#Chat::Server.new.start

#############################
  #####  #      #####  #####   
  #      #      #   #    #  
  #      #####  #####    #     
  #      #   #  #   #    #     
  #####  #   #  #   #    #     
                             
#############################
