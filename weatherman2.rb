class WeatherMan
  require 'colorize'
  require_relative 'months_hash'
  require_relative 'read_file'
  include MonthsHash
  include ReadFile
  def initialize(command, date, files_path)
    @command = command
    @date = date
    @files_path = files_path
 end

  def task_3
    data=ReadFile.read_file(@date, @files_path )
    data.each do|line|
      splitted_line=line.split(',')
      if(splitted_line[1]!='')
        print "#{splitted_line[0].split('-')[2]} "
        splitted_line[1].to_i.abs.times do
          print '+'.red
        end
        puts "#{splitted_line[1]}C"
      end
      if (splitted_line[3]!='')
        print "#{splitted_line[0].split('-')[2]} "
        splitted_line[3].to_i.abs.times do
          print '+'.blue
        end
        puts "#{splitted_line[3]}C"
      end
    end
  end

  def task_4
    data=ReadFile.read_file(@date, @files_path)
    data.each do|line|
      splitted_line=line.split(',')
      if(splitted_line[3]!='')
        print "#{splitted_line[0].split('-')[2]} "
        splitted_line[3].to_i.abs.times do
          print '+'.blue
        end
      end
      if (splitted_line[1]!='')
        splitted_line[1].to_i.abs.times do
          print '+'.red
        end
        puts " #{splitted_line[3]}C - #{splitted_line[1]}C"
      end
    end
  end

  def task_2
    calculate_highest_average_temp(ReadFile.read_file(@date, @files_path))
    calculate_lowest_average_temp(ReadFile.read_file(@date, @files_path))
    calculate_average_humidity(ReadFile.read_file(@date, @files_path))
  end

  def task_1
    var="."+@files_path
    files =Dir.entries(var)
    files= files.select {|name| name.include? @date.split('/')[0]}
    data=File.readlines("#{var}/"+files[0])
    data=data.select {|line| line.include? ','}
    data= data.reject {|line| line.include? "Temp"}
    highest_temp=data[0].split(',')[1].to_i
    lowest_temp=data[0].split(',')[3].to_i
    humidity=data[0].split(',')[7].to_i
    high_temp_date=data[0].split(',')[0]
    low_temp_date= data[0].split(',')[0]
    humidity_date=data[0].split(',')[0]
    files.each do |file_name|
      data=File.readlines("#{var}/"+file_name)
      data=data.select {|line| line.include? ','}
      data= data.reject {|line| line.include? 'Temp'}
      data.each do |line|
        splitted_line=line.split(',')
        if(splitted_line[1]!=''  && splitted_line[1].to_i>highest_temp)
          highest_temp=splitted_line[1].to_i
          high_temp_date=splitted_line[0]
        end
        if(splitted_line[7]!='' && splitted_line[7].to_i>humidity)
          humidity=splitted_line[7].to_i
          humidity_date=splitted_line[0]
        end
        if(splitted_line[3]!='' && splitted_line[3].to_i<lowest_temp)
          lowest_temp=splitted_line[3].to_i
          low_temp_date=splitted_line[0]
        end
      end
    end
    puts "Highest: #{highest_temp}C on "+ MonthsHash.Months_full_name_hash[:"#{high_temp_date.split("-")[1]}"] + " #{high_temp_date.split("-")[2]}"
    puts "Lowest: #{lowest_temp}C on " + MonthsHash.Months_full_name_hash[:"#{low_temp_date.split("-")[1]}"] + " #{low_temp_date.split("-")[2]}"
    puts "Humid: #{humidity}% on " + MonthsHash.Months_full_name_hash[:"#{humidity_date.split("-")[1]}"] + " #{humidity_date.split("-")[2]}"
  end

  def calculate_highest_average_temp(data)
    avg_high_temp_count=0
    avg_high_temp=0
    data.each do|line|
      splitted_line=line.split(',')
      if(splitted_line[1]!='')
        avg_high_temp=splitted_line[1].to_i+avg_high_temp
        avg_high_temp_count= avg_high_temp_count+1
      end
    end
    puts "Highest Average: #{avg_high_temp_count>0 ? avg_high_temp/avg_high_temp_count : nil}C"
  end

  def calculate_lowest_average_temp(data)
    avg_low_temp=0
    avg_low_temp_count=0
    data.each do|line|
      splitted_line=line.split(',')
      if(splitted_line[3]!='')
        avg_low_temp=splitted_line[3].to_i+avg_low_temp
        avg_low_temp_count=avg_low_temp_count+1
      end
    end
    puts "Lowest Average: #{avg_low_temp_count >0 ? avg_low_temp/avg_low_temp_count : nil}C"
  end

  def calculate_average_humidity(data)
    avg_humidity=0
    avg_humidity_count=0
    data.each do|line|
      splitted_line = line.split(',')
      if(splitted_line[8]!= '')
        avg_humidity = splitted_line[8].to_i+avg_humidity
        avg_humidity_count = avg_humidity_count+1
      end
    end
    puts "Average Humidity: #{avg_humidity_count>0 ? avg_humidity/avg_humidity_count : nil}%"
  end

  def start_weather_man
    if ARGV[0] == '-e'
      task_1
    elsif ARGV[0] == '-a'
      task_2
    elsif ARGV[0] == '-c'
      task_3
      task_4
    else
      puts 'Wrong command'
    end
  end
end
