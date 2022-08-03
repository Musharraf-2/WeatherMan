# # module for weatherman task1
module Task1
  def task_1(date, files_path)
    calculate_highest_temp_of_year_with_day(date, files_path)
    calculate_lowest_temp_of_year_with_day(date, files_path)
    calculate_highest_humidity_of_year_with_day(date, files_path)
  end

  def read_files(date, files_path)
    files = Dir.entries(".#{files_path}")
    files.select { |name| name.include? date.split('/')[0] }
  end

  def read_data(files_path, files)
    data = File.readlines(".#{files_path}/#{files}")
    data = data.select { |line| line.include? ',' }
    data.reject { |line| line.include? 'Temp' }
  end

  def calculate_highest_temp_of_year_with_day(date, files_path)
    files = read_files(date, files_path)
    data = read_data(files_path, files[0])
    highest_temp = data[0].split(',')[1].to_i
    high_temp_date = data[0].split(',')[0]
    files.each do |file_name|
      data = read_data(files_path, file_name)
      data.each do |line|
        splitted_line = line.split(',')
        if splitted_line[1] != '' && splitted_line[1].to_i > highest_temp
          highest_temp = splitted_line[1].to_i
          high_temp_date = splitted_line[0]
        end
      end
    end
    puts "Highest: #{highest_temp}C on"\
    " #{MONTHS_FULL_NAME_HASH[:"#{high_temp_date.split('-')[1]}"]}"\
     " #{high_temp_date.split('-')[2]}"
  end

  def calculate_lowest_temp_of_year_with_day(date, files_path)
    files = read_files(date, files_path)
    data = read_data(files_path, files[0])
    lowest_temp = data[0].split(',')[3].to_i
    low_temp_date = data[0].split(',')[0]
    files.each do |file_name|
      data = read_data(files_path, file_name)
      data.each do |line|
        splitted_line = line.split(',')
        if splitted_line[3] != '' && splitted_line[3].to_i < lowest_temp
          lowest_temp = splitted_line[3].to_i
          low_temp_date = splitted_line[0]
        end
      end
    end
    puts "Lowest: #{lowest_temp}C on"\
     " #{MONTHS_FULL_NAME_HASH[:"#{low_temp_date.split('-')[1]}"]}"\
      " #{low_temp_date.split('-')[2]}"
  end

  def calculate_highest_humidity_of_year_with_day(date, files_path)
    files = read_files(date, files_path)
    data = read_data(files_path, files[0])
    humidity = data[0].split(',')[7].to_i
    humidity_date = data[0].split(',')[0]
    files.each do |file_name|
      data = read_data(files_path, file_name)
      data.each do |line|
        splitted_line = line.split(',')
        if splitted_line[7] != '' && splitted_line[7].to_i > humidity
          humidity = splitted_line[7].to_i
          humidity_date = splitted_line[0]
        end
      end
    end
    puts "Humid: #{humidity}% on"\
    " #{MONTHS_FULL_NAME_HASH[:"#{humidity_date.split('-')[1]}"]}"\
     " #{humidity_date.split('-')[2]}"
  end
end
