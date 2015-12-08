require_relative 'row_reader'

module Sheets
  class XlsxRowReader < RowReader
    def initialize(filename, sheet)
      @workbook = RubyXL::Parser.parse(filename)
      @worksheet = @workbook[sheet]
    end

    def each
      @workbook.each { |row| yield(row) }
    end

    def import_row(row)
      # worksheet.each { |row|
      #   row && row.cells.each { |cell|
      #     val = cell && cell.value
      #     do_whatever_you_want(val)
      #   }
      # }
      # Does an unecessary copy, should probably use each instead
      @worksheet[row].cells.map {|cell| cell && cell.value }
    end
  end
end