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
            :name             => station.elements["name"].text,
            :furigana         => station.elements["furigana"].text,
            :line             => station.elements["line"].text,
            :city             => station.elements["city"].text,
            :prefecture       => station.elements["prefecture"].text,
            :direction        => station.elements["direction"].text,
            :directionReverse => station.elements["directionReverse"].text,
            :distance         => station.elements["distance"].text,
            :distanceM        => station.elements["distanceM"].text,
            :distanceKm       => station.elements["distanceKm"].text,
            :traveltime       => station.elements["traveltime"].text
          }
        end
    end
  end
end
