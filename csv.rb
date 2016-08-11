class People
  @@array = Array.new

  attr_reader :last_name, :first_name, :gender, :favorite_color, :birth_date

  def self.all_people
    @@array
  end

  def initialize(args)
    @last_name = args[:last_name]
    @first_name = args[:first_name]
    @gender = gender_parse(args[:gender])
    @favorite_color = args[:favorite_color]
    @birth_date = birth_date_parse(args[:birth_date])
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
      return birth_date
    end
  end

  def self.list_all
    People.all_people.each do |person|
      p "#{person.last_name} #{person.first_name} #{person.gender} #{person.birth_date} #{person.favorite_color}"
    end
  end
  def self.sort_by_gender_and_display
    # p People.all_people
    People.all_people.sort_by!{|item| item.last_name}
    p "AFTER"
    # p People.all_people
    People.list_all
    #  @friends.sort{|a,b| a['name']<=>b['name']}
    #  tasks.sort_by{ |t| t.due_date }
    # People.all_people.each do |person|
    # p "#{person.last_name} #{person.first_name} #{person.gender} #{person.birth_date} #{person.favorite_color}"
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
  new_data_arr =[]
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
     new_data_arr.push(hsh)
  end
  return new_data_arr
end

parse_configurations = [
#headers, delimeter, file_path
#comma
[[:last_name, :first_name, :gender, :favorite_color, :birth_date], ",", "sample/comma.txt"],
#space
[[:last_name, :first_name, :middle_initial, :gender, :birth_date, :favorite_color], " ", "sample/space.txt"],
#pipe
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
# parsed_and_hashed_data = hashIt([:last_name, :first_name, :middle_initial, :gender, :birth_date, :favorite_color], " ", "sample/space.txt")


# People.list_all
People.sort_by_gender_and_display
