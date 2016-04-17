require 'elasticsearch'

module Sheets
  class ElastisearchWriter < RowWriter
    def initialize(indexname, options = {})
      @options = {
        host: 'localhost',
        port: '9200',
        user: '',
        password: '',
        scheme: 'http',
        log: true
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
      if row==0 && col == 0
        return
      end

      body = {}
      array.each_with_index { |val, index|
        body[@keys[index]] = val unless @keys[index] == 'id'
      }
      @client.index index: @indexname, id: array[@id_col], type: @type, body: body
    end

    def save()
      @client.indices.refresh index: @indexname
    end
  end
end