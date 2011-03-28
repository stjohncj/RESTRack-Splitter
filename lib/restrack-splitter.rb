require 'rubygems'
require 'restrack-client'

module RESTRack
  class Splitter

    def initialize(uri_list, format=:JSON)
      @clients = uri_list.collect do |uri|
        RESTRack::Client.new(uri, format)
      end
      @path = ''
    end

    def method_missing(resource_name, *args)
      @clients[@next_client].resource_name(*args)
      self
    end

    def get
      @clients.each {|client| client.get }
    end

    def delete
      @clients.each {|client| client.delete }
    end

    def post(data=nil)
      @clients.each {|client| client.post(data) }
    end

    def put(data=nil)
      @clients.each {|client| client.put(data) }
    end

  end
end
