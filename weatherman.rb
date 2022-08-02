require './weatherman2.rb'
wm = WeatherMan.new(ARGV[0], ARGV[1], ARGV[2])
wm.start_weather_man
