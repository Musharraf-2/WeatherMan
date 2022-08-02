# module to read data from file
module ReadFile
  def self.read_file(date, files_path)
    var = ".#{files_path}/#{files_path.split('/')[2]}_#{date.split('/')[0]}_#{MONTHS_HASH[:"#{date.split('/')[1]}"]}.txt"
    data = File.readlines(var)
    data = data.select { |line| line.include? ',' }
    data.reject { |line| line.include? 'Temp' }
  end
end
