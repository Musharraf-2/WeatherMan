require 'colorize'
require_relative 'read_file'
require_relative 'task3'
require_relative 'task4'
require_relative 'task2'
require_relative 'task1'
include ReadFile
include Task3
include Task4
include Task2
include Task1
MONTHS_HASH = {
  :"1" => 'Jan', :"2" => 'Feb', :"3" => 'Mar',
  :"4" => 'Apr', :"5" => 'May', :"6" => 'Jun',
  :"7" => 'Jul', :"8" => 'Aug', :"9" => 'Sep',
  :"10" => 'Oct', :"11" => 'N module for weathermanov', :"12" => 'Dec'
}.freeze
MONTHS_FULL_NAME_HASH = {
  :"1" => 'January', :"2" => 'Februray', :"3" => 'March',
  :"4" => 'April', :"5" => 'May', :"6" => 'June',
  :"7" => 'July', :"8" => 'August', :"9" => 'September',
  :"10" => 'October', :"11" => 'November', :"12" => 'December'
}.freeze
# class for weatherman
class WeatherMan
  def initialize(command, date, files_path)
    @command = command
    @date = date
    @files_path = files_path
  end

  def start_weather_man
    if ARGV[0] == '-e'
      Task1.task_1(@date, @files_path)
    elsif ARGV[0] == '-a'
      Task2.task_2(@date, @files_path)
    elsif ARGV[0] == '-c'
      Task3.task_3(@date, @files_path)
      Task4.task_4(@date, @files_path)
    else
      puts 'Wrong command'
    end
  end
end
