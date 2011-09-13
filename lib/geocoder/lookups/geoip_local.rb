require 'geoip'

require 'geocoder/lookups/base'
require 'geocoder/results/geoip_local'

GEOIP_CITY_LOCAL_DB = "/usr/local/share/GeoIP/GeoLiteCity.dat"

module Geocoder::Lookup
  class GeoipLocal < Base
    private
      def results(query, reverse = false)
        return [reserved_result(query)] if loopback_address?(query)
        
        begin
          return (doc = lookup_ip_locally(query)) ? [doc] : []
        rescue StandardError
          return []
        end
      end
      
      def reserved_result(ip)
        {
          "ip"           => ip,
          "city"         => "",
          "region_code"  => "",
          "region_name"  => "",
          "metrocode"    => "",
          "zipcode"      => "",
          "latitude"     => "0",
          "longitude"    => "0",
          "country_name" => "Reserved",
          "country_code" => "RD"
        }
      end
      
      def lookup_ip_locally(ip)
        geoip_result = db.look_up(ip)
        
        {
          "ip"           => geoip_result[:ip],
          "city"         => geoip_result[:city],
          "region_code"  => geoip_result[:region],
          "region_name"  => geoip_result[:region],
          "metrocode"    => "",
          "zipcode"      => geoip_result[:postal_code],
          "latitude"     => geoip_result[:latitude],
          "longitude"    => geoip_result[:longitude],
          "country_name" => geoip_result[:country_name],
          "country_code" => geoip_result[:country_code]
        }
      end
      
      def self.db
        @@db ||= GeoIP::City.new(GEOIP_CITY_LOCAL_DB)
      end
  end
end