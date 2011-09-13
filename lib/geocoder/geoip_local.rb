require 'geocoder/geoip_loca/version'
require 'geocoder/lookups/geoip_local'

module Geocoder
  def ip_lookups
    [:geoip_local, :freegeoip]
  end
end