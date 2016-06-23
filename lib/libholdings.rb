require "libholdings/version"
require "zoom"
require "nokogiri"
require "active_support/all"
module Libholdings

  class Request
    attr_accessor :server, :port, :database_name, :record_id
  end

  def self.info(request)
    ZOOM::Connection.open(request.server, request.port) do |conn|
      conn.database_name = request.database_name
      conn.preferred_record_syntax = 'OPAC'
      begin
        rset = conn.search('@attr 1=1007 ' + request.record_id)
        xml_from_catalog = Nokogiri::XML(rset[0].xml)
        item_info = Hash.from_xml(xml_from_catalog.xpath('//holdings').to_s)
        return item_info
      rescue
        item_info = {"holdings" => {"holding" => {"localLocation" => "Unknown", "callNumber" => "Unknown ", "publicNote" => "DUE"}}}
        return item_info
      end
    end
  end
end
