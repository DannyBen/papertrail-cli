require 'time'

module Papertrail
  class Event
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def received_at
      @received_at ||= Time.parse(data['received_at'])
    end

    def to_s
      "\n#{received_at.strftime('%b %d %X')} #{data['hostname']} #{data['program']}\n#{data['message']}"
    end
  end
end