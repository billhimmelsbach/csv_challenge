


def parseData (file, delimiter)
  File.readlines(file).each do |line|
    #  line.chomp!
     line = line.split(delimiter)
     line.map!{|item| item.gsub(/\s/, "")}
     p line
  end
end

parseData("sample/comma.txt", ",")




  #
  # def parseCommaData
  #   array = []
  #   File.readlines("sample/comma.txt").each do |line|
  #      line = line.split(",")
  #      line.map!{|item| item.gsub(/\s/, "")}
  #      array << line
  #   end
  # end
  # p parseCommaData
  # #
  # def parsePipeData
  #   array = []
  #   File.readlines("sample/pipe.txt").each do |line|
  #      line = line.split("|")
  #      line.map!{|item| item.gsub(/\s/, "")}
  #      array << line
  #   end
  # end
  # parsePipeData
  # #
  # def parseSpaceData
  #   array = []
  #   File.readlines("sample/space.txt").each do |line|
  #      line = line.split(" ")
  #      line.map!{|item| item.gsub(/\s/, "")}
  #      array << line
  #   end
  # end
  #
  # parseSpaceData

  # class Comma
  #   def parseData
  #     array = []
  #     File.readlines("sample/comma.txt").each do |line|
  #        puts line
  #        puts "SPLIT"
  #        line = line.split(", ")
  #        puts line
  #        array << line
  #     end
  #     p "ARRAY"
  #     print array
  #     array
  #   end
  #   parseData()
  #   parseData = parseData
  #   p parseData
  #   # attr_reader :theme, :guesses
  #   def initialize(parseData)
  #     @last_name = parseData[0]
  #   end
  # end
  #
  # commaData = Comma.new(0)
  # p commaData
  #
  # array = []
  # File.readlines("sample/comma.txt").each do |line|
  #    puts line
  #    puts "SPLIT"
  #    line = line.split(", ")
  #    puts line
  #    array << line
  # end
  # p "ARRAY"
  # print array
