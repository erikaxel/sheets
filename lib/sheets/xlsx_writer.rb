module Sheets
  class XlsxWriter < Writer
    def initialize(filename, sheet_num=0)
      @filename = filename
      @workbook = RubyXL::Workbook.new
      @worksheet = @workbook[sheet_num]
    end

    def export_row(row, col, array)
      array.each_with_index { |val, index|
        @worksheet.add_cell(row, col+index, val)
      }
    end

    def save()
      @workbook.write(@filename)
    end
  end
end