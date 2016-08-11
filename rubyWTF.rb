def parseData (file, delimiter)
  File.readlines(file).each do |line|
     p "BEFORE"
     p line.count('\n')
     line.chomp!
     p "AFTER"
     p line.count('\n')
     line = line.split(delimiter)
     line.map!{|item| item.gsub(/\s/, "")}
  end
end

p parseData("sample/comma.txt", ",")

# def parseData (file, delimiter)
#   # each would just go through and do a thing, map creates a copy of the array that readlines creates, then the function returns that copy
#   File.readlines(file).map do |line|
#      line.chomp.split(delimiter).map{|item| item.gsub(/\s/, "")}
#   end
# end
#
# p parseData("sample/comma.txt", ",")
