require 'colorize'
require_relative 'read_file'

# module for weatherman task3
module Task3
  def task_3(date, files_path)
    data = ReadFile.read_file(date, files_path)
    data.each do |line|
      puts print_high_temp(line)
      puts print_low_temp(line)
    end
  end

  def print_low_temp(line)
    splitted_line = line.split(',')
    return nil unless splitted_line[3] != ''

    print "#{splitted_line[0].split('-')[2]} "
    splitted_line[3].to_i.abs.times do
      print '+'.blue
    end
    " #{splitted_line[3]}C"
  end

  def print_high_temp(line)
    splitted_line = line.split(',')
    return nil unless splitted_line[1] != ''
    print "#{splitted_line[0].split('-')[2]} "
    splitted_line[1].to_i.abs.times do
      print '+'.red
    end
    " #{splitted_line[1]}C"
  end
end
