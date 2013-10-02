class PassengerStatusParser
  attr_accessor :output_to_parse
  attr_reader :passenger_version

  def initialize(version = 3)
    @passenger_version = version
    @matches = {}

    @matches[:processes_max] = /max\s+=\s+(\d+)/ if @passenger_version.eql?(3)
    #Max pool size : 6
    @matches[:processes_max] = /Max pool size\s+:\s+(\d+)/ if @passenger_version.eql?(4)


    @matches[:processes_running] = /count\s+=\s+(\d+)/ if @passenger_version.eql?(3)
    #Processes     : 6
    @matches[:processes_running] = /Processes\s+:\s+(\d+)/ if @passenger_version.eql?(4)


    @matches[:queue_waiting] = /Waiting on global queue:\s+(\d+)/ if @passenger_version.eql?(3)
    #Requests in top-level queue : 0
    @matches[:queue_waiting] = /Requests in top-level queue\s+:\s+(\d+)/ if @passenger_version.eql?(4)
  end




  def processes_max
    match = output_to_parse.match(@matches[:processes_max])
    match[1]
  end

  def processes_running
    match = output_to_parse.match(@matches[:processes_running])
    match[1]
  end

  def processes_active
    if @passenger_version.eql?(3)
      match = output_to_parse.match(/active\s+=\s+(\d+)/)
      match[1]
    end
  end

  def queue_waiting
    match = output_to_parse.match(@matches[:queue_waiting])
    match[1]
  end

  def sessions_total
    total_sessions = 0
    output_to_parse.scan(/Sessions\s*:\s+(\d+)/).flatten.each { |count| total_sessions += count.to_i }
    total_sessions
  end

end