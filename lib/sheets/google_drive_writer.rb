module Sheets
  class GoogleDriveWriter < Writer
    def initialize(session, workbook_name, sheet='export_sheet')
      workbook = session.spreadsheet_by_key(workbook_name)
      @export_sheet = workbook.worksheet_by_title(sheet)
    end

    def export_row(row, col, array)
      array.each_with_index { |val, index|
        @export_sheet[row+1, col+index+1] = val
      }
    end

    def save()
      @export_sheet.save
    end
  end
end