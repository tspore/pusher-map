class MapController < ApplicationController
  
  
  def index
    
  end
  
  def los_angeles

    @current_ip = "68.183.99.42" #Mock LA IP 
    @a = get_geocode(@current_ip)
    Pusher['ip_logger'].trigger!('latitude', @a)
  end
  
  def new_york

    @current_ip = "64.90.182.55"
    @a = get_geocode(@current_ip)
    Pusher['ip_logger'].trigger!('latitude', @a)
  end
  
  def your_ip
    if request.remote_ip == "127.0.0.1"
      @current_ip = "99.148.71.207"
    else
      @current_ip = request.remote_ip  
    end

    puts @current_ip
    @a = get_geocode(@current_ip)
    Pusher['ip_logger'].trigger!('latitude', @a)
  end
  
  def get_geocode(ip_address)
    geocode = Geokit::Geocoders::MultiGeocoder.geocode(ip_address)
    return {:lat => geocode.lat, :lng => geocode.lng}
  end
  
end
