require File.join(File.dirname(__FILE__), 'test_helper')
require File.join(File.dirname(__FILE__), '../lib/passenger_status_parser')

class PassengerStatusTest < Test::Unit::TestCase

  def setup
    @status_parser_v3 = PassengerStatusParser.new(3)
    example_output_file = File.join(File.dirname(__FILE__), 'example_output/passenger-status_version-3')
    @status_parser_v3.output_to_parse = File.read(example_output_file)

    @status_parser_v4 = PassengerStatusParser.new(4)
    example_output_file = File.join(File.dirname(__FILE__), 'example_output/passenger-status_version-4')
    @status_parser_v4.output_to_parse = File.read(example_output_file)
  end

  test "max possible passenger processes are parsed correctly for Passenger version 3" do
    assert_equal "20", @status_parser_v3.processes_max
  end
  test "max possible passenger processes are parsed correctly for Passenger version 4" do
    assert_equal "6", @status_parser_v4.processes_max
  end

  test "number of running passenger processes are parsed correctly for Passenger version 3" do
    assert_equal "9", @status_parser_v3.processes_running
  end
  test "number of running passenger processes are parsed correctly for Passenger version 4" do
    assert_equal "6", @status_parser_v4.processes_running
  end

  test "number of active passenger processes are parsed correctly for Passenger version 3" do
    assert_equal "0", @status_parser_v3.processes_active
  end
  test "number of active passenger processes are parsed correctly for Passenger version 4" do
    assert_nil @status_parser_v4.processes_active
  end

  test "requests waiting on global queue are parsed correctly for Passenger version 3" do
    assert_equal "0", @status_parser_v3.queue_waiting
  end
  test "requests waiting on global queue are parsed correctly for Passenger version 4" do
    assert_equal "1", @status_parser_v4.queue_waiting
  end

  test "number of sessions (summed as total) is parsed correctly for Passenger version 3" do
    assert_equal 4, @status_parser_v3.sessions_total
  end
  test "number of sessions (summed as total) parsed correctly for Passenger version 4" do
    assert_equal 3, @status_parser_v4.sessions_total
  end


end