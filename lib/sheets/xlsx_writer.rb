module Sheets
  class XlsxWriter < RowWriter
    def initialize(filename, sheet_num = 0)
      @filename = filename
      @workbook = RubyXL::Workbook.new
      @worksheet = @workbook[sheet_num]
    end

    def add_sheet(sheet_name)
      @worksheet = @workbook.add_worksheet(sheet_name)
    end

    def export_header(array)
      export_row(0, 0, array)
    end

    def export_row(row, col, array)
      array.each_with_index do |val, index|
        c = @worksheet.add_cell(row, col + index)
        c.set_number_format('yyyy-mm-dd') if val.is_a?(Date)
        if val.is_a?(DateTime) || val.is_a?(Time)
          val = val.strftime('%Y-%m-%d %H:%M:%S')
          c.set_number_format('yyyy-mm-dd h:mm:ss')
        end
        c.change_contents(val)
      end
    end

    def save
      @workbook.write(@filename)
    end
  end
end
