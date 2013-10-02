require File.join(File.dirname(__FILE__), 'test_helper')
require File.join(File.dirname(__FILE__), '../lib/passenger_memory_stats_parser')

class PassengerMemoryStatsTest < Test::Unit::TestCase

  def setup
    @memory_stats_parser_v3 = PassengerMemoryStatsParser.new
    example_output_file = File.join(File.dirname(__FILE__), 'example_output/passenger-memory-stats_version-3')
    @memory_stats_parser_v3.output_to_parse = File.read(example_output_file)

    @memory_stats_parser_v4 = PassengerMemoryStatsParser.new
    example_output_file = File.join(File.dirname(__FILE__), 'example_output/passenger-memory-stats_version-4')
    @memory_stats_parser_v4.output_to_parse = File.read(example_output_file)
  end

  test "total memory is parsed correctly for Passenger version 3" do
    assert_equal "1080.73", @memory_stats_parser_v3.passenger_memory_total
  end

  test "total memory is parsed correctly for Passenger version 4" do
    assert_equal "1300.52", @memory_stats_parser_v4.passenger_memory_total
  end

  test "memory per app is parsed correctly for Passenger version 3" do
    memory_per_app = @memory_stats_parser_v3.passenger_memory_per_app

    assert_equal 9, memory_per_app.size
    assert_equal 4, memory_per_app["Passenger spawn server"]
    assert_equal 437, memory_per_app["Rack: /var/www/ipib/current"]
  end

  test "memory per app is parsed correctly for Passenger version 4" do
    memory_per_app = @memory_stats_parser_v4.passenger_memory_per_app

    assert_equal 4, memory_per_app.size
    assert_equal 7, memory_per_app["PassengerHelperAgent"]
    assert_equal 1289, memory_per_app["Passenger RackApp: /var/rails/canvas/current"]
  end

end