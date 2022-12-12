require "json"

class Bot
  include JSON

  def initialize
    File.exists?("dialogs.json") ? 
      @@dialogs = JSON.generate(
        File.read("dialogs.json")
      ) : @@dialogs = {}
    p @@dialogs
  end

  def add_dialog dialog
    @@dialogs[dialog[0]] = dialog[1]
    update
  end

  def update
    File.open "dialogs.json", "w" do |f|
      f.write @@dialogs
    end
  end

end

Bot.new.add_dialog(['oi amor','oie vagabunda'])
#Bot.new.generate_sentence("oi amor")
