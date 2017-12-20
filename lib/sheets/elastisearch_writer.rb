module Sheets
  class ElastisearchWriter < RowWriter
    def initialize(indexname, options = {})
      @options = {
        host: 'localhost',
        port: '9200',
        user: '',
        password: '',
        scheme: 'http',
        log: true,
        retries: 3
      }.merge options
      @client = Elasticsearch::Client.new log: @options[:log], hosts: {
        host: @options[:host],
        port: @options[:port],
        user: @options[:user],
        password: @options[:password],
        scheme: @options[:scheme]
      }
      @indexname = indexname
    end

    def add_sheet(sheet_name)
      @type = sheet_name
    end

    def export_keys(array)
      @keys = array
      @id_col = @keys.index 'id'
    end

    def export_row(row, col, array)
      raise 'Need to call add_sheet() before exporting row' if @type.nil?

      # We interpret row 0 as at the header
      return if row == 0 && col == 0

      body = {}
      array.each_with_index do |val, index|
        body[@keys[index]] = val unless @keys[index] == 'id'
      end
      for i in 0..@options[:retries]
        begin
          @client.index index: @indexname, id: array[@id_col], type: @type, body: body
          break # Successfull, break the loop
        rescue Exception => e
          puts e.message
          raise e if i == @options[:retries]
          sleep 5
        end
      end
    end

    def save
      @client.indices.refresh index: @indexname
    end
  end
end
