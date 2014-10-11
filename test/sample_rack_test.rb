require "test/unit"
require "rack/test"

class SampleRackTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Rack::Builder.new do
      run Proc.new { |env| [200, {'Content-Type' => 'text/plain'}, ['Ok.']] }  
    end
  end

  def test_ok_response
    get '/'
    assert last_response.ok?, "Expected 200 status response."
  end

end

