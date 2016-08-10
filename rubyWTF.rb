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
