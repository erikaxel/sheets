require 'elasticsearch'

module Sheets
  class ElastisearchWriter < RowWriter
    def initialize(indexname, type, keys, options = {})
      @options = {
        host: 'localhost',
        port: '9200',
        user: '',
        password: '',
        scheme: 'http',
        log: true
      }.merge options
      @keys = keys
      @type = type
      @client = Elasticsearch::Client.new log: @options[:log], hosts: {
        host: @options[:host],
        port: @options[:port],
        user: @options[:user],
        password: @options[:password],
        scheme: @options[:scheme]
      }
      @indexname = indexname
      @id_col = @keys.index 'id'
    end

    def export_row(row, col, array)
      return unless array[@id_col].is_a? Integer

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