#a csv parser which requires no additional ruby modules(CSV, DateTime, etc) or gems
#standard ruby only

class People
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
    @birth_date_presort = date_parser(@birth_date)
    p @birth_date_presort
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

  def date_parser (birth_date)
    year = birth_date.match(/\d{4}$/)[0]
    month = birth_date.match(/^\d\d?/)[0]
    day = birth_date.match(/\/(\d\d?)\//).captures[0]
    month = "0" + month if month.length == 1
    day = "0" + day if day.length == 1
    year + month + day
  end

  def self.list_all
    People.all_people.each do |person|
      p "#{person.last_name} #{person.first_name} #{person.gender} #{person.birth_date} #{person.favorite_color}"
    end
  end

  def self.sort_by_gender_ascending_and_display
    People.all_people.sort_by!{|person| [person.gender, person.last_name]}
    p "Display 1"
    People.list_all
    puts
  end

  def self.sort_by_date_ascending_and_display
    People.all_people.sort_by!{|person| [person.birth_date_presort, person.last_name]}
    p "Display 2"
    People.list_all
    puts
  end

  def self.sort_by_last_name_descending_and_display
    People.all_people.sort_by!{|person| [person.last_name]}.reverse!
    p "Display 3"
    People.list_all
    puts
  end
end


# after the function has completed, the copy gets dumped
def parseData (file, delimiter)
  # each would just go through and do a thing, map creates a copy of the array that readlines creates, then the function returns that copy
  File.readlines(file).map do |line|
     line.chomp.split(delimiter).map{|item| item.gsub(/\s/, "")}
  end
end

#configuration = (headers, delimiter, file_path)
def hashIt (configuration)
  final_data_array =[]
  headers = configuration[0]
  delimiter = configuration[1]
  file_path = configuration[2]
  parsedData = parseData(file_path, delimiter)
  parsedData.each do |row|
     hsh = {}
     current_column_index = 0
     headers.each do |header|
        hsh[header] = row[current_column_index]
        current_column_index += 1
     end
     final_data_array.push(hsh)
  end
  return final_data_array
end

parse_configurations = [
#comma; format = [headers, delimeter, file_path]
[[:last_name, :first_name, :gender, :favorite_color, :birth_date], ",", "sample/comma.txt"],
#space; format = [headers, delimeter, file_path]
[[:last_name, :first_name, :middle_initial, :gender, :birth_date, :favorite_color], " ", "sample/space.txt"],
#pipe; format = [headers, delimeter, file_path]
[[:last_name, :first_name, :middle_initial, :gender, :favorite_color, :birth_date], "|", "sample/pipe.txt"]
]

parsed_data_array =[]
parse_configurations.each do |configuration|
  parsed_and_hashed_data = hashIt(configuration)
  parsed_and_hashed_data
  parsed_and_hashed_data.each do |data|
      data
      People.new(data)
  end
end

# People.list_all
People.sort_by_gender_ascending_and_display
People.sort_by_date_ascending_and_display
People.sort_by_last_name_descending_and_display
