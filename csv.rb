#a csv parser which requires no additional ruby libraries(CSV, DateTime, etc) or gems.
#parses data from files, puts data into person classes, displays data according to spec

class Person
  @@array = Array.new

  attr_reader :last_name, :first_name, :gender, :favorite_color, :birth_date, :birth_date_presort

  def self.all_people
    @@array
  end

  def initialize(args)
    @last_name = args[:last_name]
    @first_name = args[:first_name]
    @gender = gender_parse(args[:gender])
    @favorite_color = args[:favorite_color]
    @birth_date = birth_date_parse(args[:birth_date])
    @birth_date_presort = birth_date_presorter(@birth_date)
    @@array << self
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
      birth_date
    end
  end

#parses birth_date into a string that can later be sorted by date
  def birth_date_presorter (birth_date)
    year = birth_date.match(/\d{4}$/)[0]
    month = birth_date.match(/^\d\d?/)[0]
    day = birth_date.match(/\/(\d\d?)\//).captures[0]
    month = "0" + month if month.length == 1
    day = "0" + day if day.length == 1
    year + month + day
  end

  def self.display_all
    Person.all_people.each do |person|
      p "#{person.last_name} #{person.first_name} #{person.gender} #{person.birth_date} #{person.favorite_color}"
    end
  end

  def self.sort_by_gender_ascending_and_display
    Person.all_people.sort_by!{|person| [person.gender, person.last_name]}
    p "Output 1"
    Person.display_all
    puts
  end

  def self.sort_by_date_ascending_and_display
    Person.all_people.sort_by!{|person| [person.birth_date_presort, person.last_name]}
    p "Output 2"
    Person.display_all
    puts
  end

  def self.sort_by_last_name_descending_and_display
    Person.all_people.sort_by!{|person| [person.last_name]}.reverse!
    p "Output 3"
    Person.display_all
    puts
  end
end

def open_files_and_parse_data (file, delimiter)
  File.readlines(file).map do |line|
     line.chomp.split(delimiter).map{|item| item.gsub(/\s/, "")}
  end
end

def convert_strings_to_hashes (configuration) #configuration = (headers, delimiter, file_path)
  final_hashed_data_array =[]
  headers = configuration[0]
  delimiter = configuration[1]
  file_path = configuration[2]
  parsed_data = open_files_and_parse_data(file_path, delimiter)
  parsed_data.each do |line|
     hash = {}
     current_column_index = 0
     headers.each do |header|
        hash[header] = line[current_column_index]
        current_column_index += 1
     end
     final_hashed_data_array.push(hash)
  end
  final_hashed_data_array
end

PARSE_CONFIGURATIONS = [
#comma; format = [headers, delimeter, file_path]
[[:last_name, :first_name, :gender, :favorite_color, :birth_date], ",", "sample/comma.txt"],
#space; format = [headers, delimeter, file_path]
[[:last_name, :first_name, :middle_initial, :gender, :birth_date, :favorite_color], " ", "sample/space.txt"],
#pipe; format = [headers, delimeter, file_path]
[[:last_name, :first_name, :middle_initial, :gender, :favorite_color, :birth_date], "|", "sample/pipe.txt"]
]

def parse_files
  PARSE_CONFIGURATIONS.each do |configuration|
    parsed_and_hashed_data = convert_strings_to_hashes(configuration)
    parsed_and_hashed_data.each do |data|
        Person.new(data)
    end
  end
end

#parses data from files, puts data into person classes, displays data according to spec
parse_files
Person.sort_by_gender_ascending_and_display
Person.sort_by_date_ascending_and_display
Person.sort_by_last_name_descending_and_display
