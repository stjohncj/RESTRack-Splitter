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
      execute {|client| client.__send__(resource_name.to_sym, *args) }
      self
    end

    def get
      execute {|client| client.get }
    end

    def delete
      execute {|client| client.delete }
    end

    def post(data=nil)
      execute {|client| client.post(data) }
    end

    def put(data=nil)
      execute {|client| client.put(data) }
    end

    private

    def execute(&action)
      threads = []
      results = []
      for client in @clients
        threads << Thread.new(client) {|client| results << action.call(client) }
      end
      threads.each { |thread| thread.join }
      results
    end

  end
end
