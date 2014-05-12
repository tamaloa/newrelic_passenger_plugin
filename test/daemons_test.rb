require File.join(File.dirname(__FILE__), 'test_helper')

class DaemonsTest < Test::Unit::TestCase

  def setup
    @passenger_daemon = File.join(File.dirname(__FILE__), '../newrelic_passenger_agent.daemon')
  end

  test "the daemon should return a correct status" do
    daemon_status = `#{@passenger_daemon} status`
    assert_equal "newrelic_passenger_agent: no instances running\n", daemon_status
  end

end


