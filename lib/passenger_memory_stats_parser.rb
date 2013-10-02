class PassengerMemoryStatsParser

  attr_accessor :output_to_parse

  def passenger_memory_total(command_output = output_to_parse)
    match = command_output.match(/RSS:\s*([\d\.]+)\s*MB\Z/m)

    match[1]
  end

  def passenger_memory_per_app(command_output = output_to_parse)
    passenger_processes = Hash.new(0)
    passenger_section_found = false
    command_output.lines.each do |line|

      passenger_section_start = /.*----- Passenger processes ------.*/
      passenger_section_found = true if line.match(passenger_section_start)
      next unless passenger_section_found

      #PID    VMSize    Private   Name
      #--------------------------------
      #7402   418.2 MB  53.9 MB   Rack: /var/www/app/current
      passenger_process_line = /^(\d+)\s*([\d\.]+)\s*MB\s*([\d\.]+)\s*MB\s*(.*)$/
      match = line.match(passenger_process_line)

      next unless match

      passenger_processes[match[4]] += match[3].to_i
    end

    passenger_processes

  end
end