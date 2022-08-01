class WeatherMan
  require 'colorize'
  @@months_hash={1=>"Jan", 2=>"Feb",3=>"Mar", 4=>"Apr", 5=>"May",6=>"Jun",7=>"Jul",8=>"Aug",9=>"Sep",10=>"Oct",11=>"Nov",12=>"Dec"}
  @@months_full_name_hash={1=>"January", 2=>"Februray",3=>"March", 4=>"April", 5=>"May",6=>"June",7=>"July",8=>"August",9=>"September",10=>"October",11=>"November",12=>"December"}
  def self.task_3
    var=ARGV[2]+"/"+ARGV[2].split("/")[2]+"_#{ARGV[1].split("/")[0]}_#{@@months_hash[ARGV[1].split("/")[1].to_i]}.txt"
    var=var.sub("/","")
    data=File.readlines(var)
    lines_to_skip=(ARGV[2].include? "lahore") ? 2 : 1
    data.drop(lines_to_skip).each do|line|
      splitted_line=line.split(",")
      if(splitted_line[1]!="" && (!splitted_line[0].include? "<"))
        print "#{splitted_line[0].split("-")[2]} "
        splitted_line[1].to_i.abs.times do
          print "+".red
        end
        puts "#{splitted_line[1]}C"
      end
      if (splitted_line[3]!="" && (!splitted_line[0].include? "<"))
        print "#{splitted_line[0].split("-")[2]} "
        splitted_line[3].to_i.abs.times do
          print "+".blue
        end
        puts "#{splitted_line[3]}C"
      end
    end
  end
  def self.task_4
    var=ARGV[2]+"/"+ARGV[2].split("/")[2]+"_#{ARGV[1].split("/")[0]}_#{@@months_hash[ARGV[1].split("/")[1].to_i]}.txt"
    var=var.sub("/","")
    data=File.readlines(var)
    lines_to_skip=(ARGV[2].include? "lahore") ? 2 : 1
    data.drop(lines_to_skip).each do|line|
      splitted_line=line.split(",")
      if(splitted_line[3]!="" && (!splitted_line[0].include? "<"))
        print "#{splitted_line[0].split("-")[2]} "
        splitted_line[3].to_i.abs.times do
          print "+".blue
        end
      end
      if (splitted_line[1]!="" && (!splitted_line[0].include? "<"))
        splitted_line[1].to_i.abs.times do
          print "+".red
        end
        puts " #{splitted_line[3]}C - #{splitted_line[1]}C"
      end
    end
  end
  def self.task_2
    lines_to_skip=(ARGV[2].include? "lahore") ? 2 : 1
    var=ARGV[2]+"/"+ARGV[2].split("/")[2]+"_#{ARGV[1].split("/")[0]}_#{@@months_hash[ARGV[1].split("/")[1].to_i]}.txt"
    var=var.sub("/","")
    data=File.readlines(var)
    avg_high_temp=0
    avg_high_temp_count=0
    avg_low_temp=0
    avg_low_temp_count=0
    avg_humidity=0
    avg_humidity_count=0
    data.drop(lines_to_skip).each do|line|
      splitted_line=line.split(",")
      if(splitted_line[1]!="" && (!splitted_line[0].include? "<"))
        avg_high_temp=splitted_line[1].to_i+avg_high_temp
        avg_high_temp_count= avg_high_temp_count+1
      end
      if(splitted_line[3]!="" && (!splitted_line[0].include? "<"))
        avg_low_temp=splitted_line[3].to_i+avg_low_temp
        avg_low_temp_count=avg_low_temp_count+1
      end
      if(splitted_line[8]!="" && (!splitted_line[0].include? "<"))
        avg_humidity=splitted_line[8].to_i+avg_humidity
        avg_humidity_count=avg_humidity_count+1
      end
    end
    puts "Highest Average: #{avg_high_temp_count>0 ? avg_high_temp/avg_high_temp_count : nil}C"
    puts "Lowest Average: #{avg_low_temp_count >0 ? avg_low_temp/avg_low_temp_count : nil}C"
    puts "Average Humidity: #{avg_humidity_count>0 ? avg_humidity/avg_humidity_count : nil}%"
  end
  def self.task_1
    lines_to_skip=(ARGV[2].include? "lahore") ? 2 : 1
    var=ARGV[2].sub("/","")
    files =Dir.entries(var)
    highest_temp=File.readlines("#{var}/"+files[2])[lines_to_skip].split(",")[1].to_i
    lowest_temp=File.readlines("#{var}/"+files[2])[lines_to_skip].split(",")[3].to_i
    humidity=File.readlines("#{var}/"+files[2])[lines_to_skip].split(",")[7].to_i
    high_temp_date=File.readlines("#{var}/"+files[2])[lines_to_skip].split(",")[0]
    low_temp_date= File.readlines("#{var}/"+files[2])[lines_to_skip].split(",")[0]
    humidity_date=File.readlines("#{var}/"+files[2])[lines_to_skip].split(",")[0]
    files.drop(3).each do |file_name|
      data=File.readlines("#{var}/"+file_name)
      data.drop(lines_to_skip).each do |line|
        splitted_line=line.split(",")
        if(splitted_line[1]!="" && (!splitted_line[0].include? "<") && splitted_line[1].to_i>highest_temp)
          highest_temp=splitted_line[1].to_i
          high_temp_date=splitted_line[0]
        end
        if(splitted_line[7]!="" && (!splitted_line[0].include? "<") && splitted_line[7].to_i>humidity)
          humidity=splitted_line[7].to_i
          humidity_date=splitted_line[0]
        end
        if(splitted_line[3]!="" && (!splitted_line[0].include? "<") && splitted_line[3].to_i<lowest_temp)
          lowest_temp=splitted_line[3].to_i
          low_temp_date=splitted_line[0]
        end
      end
    end
    puts "Highest: #{highest_temp}C on #{@@months_full_name_hash[high_temp_date.split("-")[1].to_i]} #{high_temp_date.split("-")[2]}"
    puts "Lowest: #{lowest_temp}C on #{@@months_full_name_hash[low_temp_date.split("-")[1].to_i]} #{low_temp_date.split("-")[2]}"
    puts "Humid: #{humidity}% on #{@@months_full_name_hash[humidity_date.split("-")[1].to_i]} #{humidity_date.split("-")[2]}"
  end
  def self.start_weather_man
    if(ARGV[0]=="-e")
      WeatherMan.task_1
    end
    if(ARGV[0]=="-a")
      WeatherMan.task_2
    end
    if(ARGV[0]=="-c")
      WeatherMan.task_3
      WeatherMan.task_4
    end
  end
end
