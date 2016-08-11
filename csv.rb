# after the function has completed, the copy gets dumped
def parseData (file, delimiter)
  # each would just go through and do a thing, map creates a copy of the array that readlines creates, then the function returns that copy
  File.readlines(file).map do |line|
     line.chomp.split(delimiter).map{|item| item.gsub(/\s/, "")}
  end
end

new_data_arr =[]
def hashIt (headers, delimiter, file_path)
  new_data_arr = []
  parsedData = parseData(file_path, delimiter)
  parsedData.each do |row|
     hsh = {}
     current_column_index = 0
     headers.each do |header|
        hsh[header] = row[current_column_index]
        current_column_index += 1
     end
     new_data_arr.push(hsh)
  end
  return new_data_arr
end

class People
  attr_reader :last_name, :first_name, :gender, :favorite_color, :birth_date
  def initialize(args)
    @last_name = args[:last_name]
    @first_name = args[:first_name]
    @gender = gender_parse(args[:gender])
    @favorite_color = args[:favorite_color]
    @birth_date = birth_date_parse(args[:birth_date])
  end

    def gender_parse(gender)
      if gender == "F"
        return "Female"
      elsif gender == "M"
        return "Male"
      else
        gender
      end
    end

    def birth_date_parse(birth_date)
      if birth_date.match(/-/)
        return birth_date.gsub("-", "/")
      else
        return birth_date
      end
    end


  def self.all
    p self.all
  end
end

parsed_and_hashed_data = hashIt([:last_name, :first_name, :middle_initial, :gender, :birth_date, :favorite_color], " ", "sample/space.txt")
# print "\n TEST TEST TEST"
# print parsed_and_hashed_data
parsed_and_hashed_data.each do |data|
  # p data
  p People.new(data)
end
#
# def self.all
# p People.all

# def self.all




# p new_data_arr
# headers = [last_name, first_name, gender, favorite_color, birth_date]
# delimiter = ","
# file_name = "sample/comma.txt"
# # space
# headers = [last_name, first_name, middle_initial, gender, birth_date, favorite_color]
# delimiter = " "
# file_name = "sample/space.txt"
# # pipe
# headers = [last_name, first_name, middle_initial, gender, favorite_color, birth_date]
# delimiter = "|"
# file_name = "sample/pipe.txt"

# str = "hello"
# str1 = str
# str1.gsub! "hello", "whoa!"
# puts str1 #=> whoa
# puts str #=> whoa

# array = ["123"]
# array = array.split('') #the right side of the function points to the original, then the left is a new copy created, that will be the new reference



# def testByReference

# def parseData (file, delimiter)
#   #I'm going to take the file, and at each line break, I'm going to assign some space in the memorory for each line, I'm going to do something to each of the reserved spaces in memory called "lines"
#   File.readlines(file).each do |line|
#      line.chomp! #edits line by reference, actually change the memory block your're given
#      line = line.chomp #creates a new instance of line, creates a new memory block copy with the modification
#      line.split(delimiter).map{|item| item.gsub(/\s/, "")}
#   end
# end

# p parseData("sample/comma.txt", ",")
  #
  # def parseData (file, delimiter)
  #   array = []
  #   File.readlines(file).each do |line|
  #     #  line.chomp!
  #      line = line.split(delimiter)
  #      line.map!{|item| item.gsub(/\s/, "")}
  #      array << line
  #   end
  #   array
  # end
  #




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
