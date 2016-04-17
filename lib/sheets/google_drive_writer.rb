module Sheets
  class GoogleDriveRowWriter < RowWriter
    def initialize(session, workbook_name, sheet='export_test')
      workbook = session.spreadsheet_by_key(workbook_name)
      @export_sheet = workbook.worksheet_by_title(sheet)
    end

    def export_row(row, col, array)
      array.each_with_index { |val, index|
        if val.is_a? Numeric
          val = val.to_s.gsub('.', ',')
        end
        @export_sheet[row+1, col+index+1] = val
      }
    end

    def export_header(array)
      export_row(0, 0, array)
    end

    def save()
      @export_sheet.save
    end
  end
end