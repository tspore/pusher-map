class MapController < ApplicationController
  
  
  def index
    
  end
  
  def los_angeles

    @current_ip = "68.183.99.42" #Mock LA IP 
    @a = Geokit::Geocoders::MultiGeocoder.geocode(@current_ip)
    Pusher['ip_logger'].trigger!('latitude', " #{@a.lat}, #{@a.lng}")
  end
  
  def new_york

    @current_ip = "64.90.182.55"
    @a = Geokit::Geocoders::MultiGeocoder.geocode(@current_ip)
    Pusher['ip_logger'].trigger!('latitude', " #{@a.lat}, #{@a.lng}")
  end
  
  def your_ip
    if request.remote_ip == "127.0.0.1"
      @current_ip = "99.148.71.207"
    else
      @current_ip = request.remote_ip  
    end

    puts @current_ip
    @a = Geokit::Geocoders::MultiGeocoder.geocode(@current_ip)
    Pusher['ip_logger'].trigger!('latitude', " #{@a.lat}, #{@a.lng}")
  end
end
