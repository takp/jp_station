require 'net/https'
require 'uri'
require 'rexml/document'

module JpStation
  class Simpleapi

    SIMPLEAPI_URL = "http://map.simpleapi.net/stationapi"

    class << self
      def stations(lat = "35.6946", lng = "139.6945")
        response = get_stations(lat, lng)
        hash = {
          :count    => response.elements["result"].elements.size,
          :stations => []
        }
        response.elements.each("result/station") do |station|
          hash[:stations] << station_hash(station)
        end
        hash
      end

      private
        def get_stations(lat, lng)
          url = SIMPLEAPI_URL + "?x=#{lng}&y=#{lat}&output=xml"
          uri = URI.parse(URI.encode(url))
          raw_response = Net::HTTP.get(uri)
          REXML::Document.new(raw_response)
        end

        def station_hash(station)
          {
            :name             => blank_if_nil( station.elements["name"] ),
            :furigana         => blank_if_nil( station.elements["furigana"] ),
            :line             => blank_if_nil( station.elements["line"] ),
            :city             => blank_if_nil( station.elements["city"] ),
            :prefecture       => blank_if_nil( station.elements["prefecture"] ),
            :direction        => blank_if_nil( station.elements["direction"] ),
            :directionReverse => blank_if_nil( station.elements["directionReverse"] ),
            :distance         => blank_if_nil( station.elements["distance"] ),
            :distanceM        => blank_if_nil( station.elements["distanceM"] ),
            :distanceKm       => blank_if_nil( station.elements["distanceKm"] ),
            :traveltime       => blank_if_nil( station.elements["traveltime"] )
          }
        end

        def blank_if_nil(element)
          element ? element.text : ""
        end
    end
  end
end
