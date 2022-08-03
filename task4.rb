require 'colorize'
require_relative 'read_file'

# module for weatherman task4
module Task4
  def task_4(date, files_path)
    data = ReadFile.read_file(date, files_path)
    data.each do |line|
      print_lowest_temp(line)
      print_highest_temp(line)
    end
  end

  def print_lowest_temp(line)
    splitted_line = line.split(',')
    return nil unless splitted_line[3] != ''
    print "#{splitted_line[0].split('-')[2]} "
    splitted_line[3].to_i.abs.times do
      print '+'.blue
    end
  end

  def print_highest_temp(line)
    splitted_line = line.split(',')
    return nil unless splitted_line[1] != ''
    splitted_line[1].to_i.abs.times do
      print '+'.red
    end
    puts " #{splitted_line[3]}C - #{splitted_line[1]}C"
  end
end
