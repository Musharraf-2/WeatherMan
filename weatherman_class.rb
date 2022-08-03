require_relative 'task3'
require_relative 'task4'
require_relative 'task2'
require_relative 'task1'
# class for weatherman
class WeatherMan
  include Task3
  include Task4
  include Task2
  include Task1
  def initialize(command, date, files_path)
    @command = command
    @date = date
    @files_path = files_path
  end

  def execute_weather_man
    if ARGV[0] == '-e'
      task_1(@date, @files_path)
    elsif ARGV[0] == '-a'
      task_2(@date, @files_path)
    elsif ARGV[0] == '-c'
      task_3(@date, @files_path)
      task_4(@date, @files_path)
    else
      puts 'Wrong command.'
    end
  end
end
