# module for weatherman task1
module Task2
  def task_2(date, files_path)
    calculate_highest_average_temp(ReadFile.read_file(date, files_path))
    calculate_lowest_average_temp(ReadFile.read_file(date, files_path))
    calculate_average_humidity(ReadFile.read_file(date, files_path))
  end

  def calculate_highest_average_temp(data)
    avg_high_temp_count = 0
    avg_high_temp = 0
    data.each do |line|
      splitted_line = line.split(',')
      if splitted_line[1] != ''
        avg_high_temp = splitted_line[1].to_i + avg_high_temp
        avg_high_temp_count += 1
      end
    end
    puts "Highest Average: #{avg_high_temp_count > 0 ? avg_high_temp / avg_high_temp_count : nil}C"
  end

  def calculate_lowest_average_temp(data)
    avg_low_temp = 0
    avg_low_temp_count = 0
    data.each do |line|
      splitted_line = line.split(',')
      if splitted_line[3] != ''
        avg_low_temp = splitted_line[3].to_i + avg_low_temp
        avg_low_temp_count += 1
      end
    end
    puts "Lowest Average: #{avg_low_temp_count > 0 ? avg_low_temp / avg_low_temp_count : nil}C"
  end

  def calculate_average_humidity(data)
    avg_humidity = 0
    avg_humidity_count = 0
    data.each do |line|
      splitted_line = line.split(',')
      if splitted_line[8] != ''
        avg_humidity = splitted_line[8].to_i + avg_humidity
        avg_humidity_count += 1
      end
    end
    puts "Average Humidity: #{avg_humidity_count > 0 ? avg_humidity / avg_humidity_count : nil}%"
  end
end
