# module for weatherman task3
module Task3
  def task_3(date, files_path)
    data = ReadFile.read_file(date, files_path)
    data.each do |line|
      splitted_line = line.split(',')
      if splitted_line[1] != ''
        print "#{splitted_line[0].split('-')[2]} "
        splitted_line[1].to_i.abs.times do
          print '+'.red
        end
        puts "#{splitted_line[1]}C"
      end
      if splitted_line[3] != ''
        print "#{splitted_line[0].split('-')[2]} "
        splitted_line[3].to_i.abs.times do
          print '+'.blue
        end
        puts "#{splitted_line[3]}C"
      end
    end
  end
end
