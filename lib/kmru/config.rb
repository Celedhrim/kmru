require "iniparse"

module Kmru

  # create the config
  def self.confcreate(conffilepath)
    docs = IniParse.gen do |doc|
      doc.section("kmru") do |kmru|
        kmru.option("host","127.0.0.1")
        kmru.option("port","80")
        kmru.option("user","kodi")
        kmru.option("pass","kodi")
        kmru.option("number","10")
      end
    end
    docs.save(conffilepath)
    puts "Conf file created : #{conffilepath}"
    puts "Edit to fit your need then run again"
    #Add exit
    exit
  end

  # Read the config
  def self.confread(conffilepath)
    confcreate(conffilepath) unless File.exists?(conffilepath)
    IniParse.parse( File.read(conffilepath) )['kmru']
  end

end
