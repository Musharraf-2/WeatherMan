# module ReadFile
module ReadFile
  def self.read_file(date, files_path)
    var = '.' + files_path + '/' + files_path.split('/')[2] + "_#{date.split('/')[0]}_" + Months_hash[:"#{date.split('/')[1]}"] + '.txt'
    data = File.readlines(var)
    data = data.select { |line| line.include? ',' }
    data.reject { |line| line.include? 'Temp' }
  end
end
