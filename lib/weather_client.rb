class WeatherClient
  include HTTParty
  base_uri 'lpo.dt.navy.mil/data/DM/'
  def initialize(date)
    @date = Date.parse(date)
  end
  def wind_speed
    response = self.class.get("/#{year}/#{formatted_date}/Wind_Speed")
    extract_readings(response.body)
  end
  def air_temp
    response = self.class.get("/#{year}/#{formatted_date}/Air_Temp")
    extract_readings(response.body)
  end
  def barometric_pressure
    response = self.class.get("/#{year}/#{formatted_date}/Barometric_Press")
    extract_readings(response.body)
  end
  private
  def year
    @date.year
  end
  def formatted_date
    @date.strftime("%Y_%m_%d")
  end
  def extract_readings(data)
    data.split(/\n/).collect do |line|
      items = line.chomp.split(" ")
      items[2].to_f
    end
  end
end