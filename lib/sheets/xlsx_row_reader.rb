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
      row = @worksheet[row]
      row.nil? ? nil : row.cells.map { |cell| cell&.value }
    end

    def num_rows
      @worksheet.count
    end

    # Noop
    def as_date(date)
      date
    end
  end
end
