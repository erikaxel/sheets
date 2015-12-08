require_relative 'row_reader'

module Sheets
  class GoogleDriveRowReader < RowReader
    def initialize(session, workbook_name, sheet)
      workbook = session.spreadsheet_by_key(workbook_name)
      @sheet = workbook.worksheet_by_title(sheet)
    end

    # NB! If auto_change is true (which is the default), we will do quite a bit of memory
    # management because of auto
    def import_row(row_index, auto_change=true)
      if auto_change
        return_arr = Array.new

        @sheet.rows[row_index].each_with_index { |cell, col_index|
            num = @sheet.numeric_value(row_index+1, col_index+1)
            if num.nil?
              return_arr.push @sheet[row_index+1, col_index+1]
            else
              return_arr.push num
            end
        }
        return_arr
      else
        @sheet.rows[row_index]
      end
    end

    def num_rows
      @sheet.num_rows
    end
  end
end