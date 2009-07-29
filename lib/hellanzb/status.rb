module Hellanzb
  class Status
    attr_reader :config, :currently_downloading, :currently_processing,
                :eta, :hostname, :is_paused, :maxrate,
                :percent_complete, :queued, :queued_mb, :rate, :time,
                :total_dl_files, :total_dl_mb, :total_dl_nzbs, :total_dl_segments,
                :uptime, :version

    def initialize(status, client)
      @client = client
      parse_status(status)
    end

    def update
      parse_status(@client.call('status'))
    end

    private
    def parse_status(status)
      status.each do |key, value|
        instance_variable_set(:"@#{key}", value)
      end
    end
  end
end
