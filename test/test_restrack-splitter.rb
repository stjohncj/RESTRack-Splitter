require File.join( File.dirname(__FILE__ ), 'helper' )

class TestRestrackSplitter < Test::Unit::TestCase
  context 'instantiation' do
    should 'accept a String URI' do
      assert_nothing_raised { client_1 = RESTRack::Splitter.new(['http://localhost:9292', 'http://localhost:9293']) }
    end
    should 'accept a URI object' do
      uri = URI.parse('http://localhost:9292')
      assert_nothing_raised { client_2 = RESTRack::Client.new(uri) }
    end
  end

  should 'get a resource' do
    client = RESTRack::Splitter.new(['http://localhost:9292', 'http://localhost:9293'])
    get_response = nil
    assert_nothing_raised do
      get_response = client.responses(1).get
    end
    expected_response = [{ 'action' => 'show', 'id' => '1' }, { 'action' => 'show', 'id' => '1' }]
    assert_equal expected_response, get_response
  end
end
