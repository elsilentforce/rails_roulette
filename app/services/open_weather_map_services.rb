class OpenWeatherMapServices
  # api.openweathermap.org/data/2.5/forecast/daily?q=London&mode=xml&units=metric&cnt=7
  # api.openweathermap.org/data/2.5/forecast/daily?id={city ID}&cnt={cnt}
  # api.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22
  # fa3df9bff4314e742477148a1cd2c73b
  #attr_accessor :url

  def initialize options = {}
    @url = 'https://api.openweathermap.org/data/2.5'
    @city = options[:city]
    @appid = ENV["OPENWEATHER_API_KEY"]
    @cnt = options[:cnt] || 7
  end

  def cities
    get(@url + "/weather", { q: @city, appid: @appid })
  end

  def forecast
    city_id = cities['id']
    get(@url + "/forecast", { id: city_id, cnt: @cnt, appid: @appid })
  end

  def get url, options = {}
    response = Typhoeus.get(url, params: options, followlocation: true)
    JSON.parse(response.body) rescue []
  end

  def will_rain_next_week?
    rain_flag = false
    forecast['list'].each do |f|
      rain_flag = true if f['weather'][0]['main'].eql? "Rain"
    end
    rain_flag
  end
end
