require "extralite"

module DBconn
  class Connect
    include Extralite

    def initialize(path)
      @db = Database.new path
    end

    def exec(cmd)
      @db.query(cmd)
    end
  end
end

#db = DBconn::Connect.new("base.db")
#p db.exec "select * from messages"

###############

  ###    ####
  #  #   #   #
  #   #  #   #
  #   #  ####
  #   #  #   #
  #  #   #   #
  ###    ####

###############
