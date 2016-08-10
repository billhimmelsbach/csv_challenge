
  def parseCommaData
    array = []
    File.readlines("sample/comma.txt").each do |line|
       puts line
       puts "SPLIT"
       line = line.split(",")
       line.each do |item|
         p "ITEM!"
         p item
         item.gsub(/\s/, "")
         p "AFTER!"
         p item
       end
       puts line
       array << line
    end
    p "ARRAY"
    print array
  end
    # p "ARRAY"
    # print array
  p parseCommaData
  # #
  # def parsePipeData
  #   array = []
  #   File.readlines("sample/pipe.txt").each do |line|
  #      puts line
  #      puts "SPLIT"
  #      line = line.split("|")
  #      line.map!{|item| item.gsub(/\s/, "")}
  #      puts line
  #      array << line
  #   end
  #   p "ARRAY"
  #   print array
  # end
  # parsePipeData
  #
  # def parseSpaceData
  #   array = []
  #   File.readlines("sample/space.txt").each do |line|
  #     #  puts line
  #     #  puts "SPLIT"
  #      line = line.split(" ")
  #      line.each do |item|
  #        item.gsub(/\s/, "")
  #      end
  #
  #     #  puts line
  #      array << line
  #   end
  # end
  #
  # p parseSpaceData

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
