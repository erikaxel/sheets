module Sheets
  class GoogleDriveRowWriter < RowWriter
    def initialize(session, workbook_name, sheet = 'export_test')
      workbook = session.spreadsheet_by_key(workbook_name)
      @export_sheet = workbook.worksheet_by_title(sheet)
    end

    def export_row(row, col, array)
      array.each_with_index do |val, index|
        val = val.to_s.tr('.', ',') if val.is_a? Numeric
        @export_sheet[row + 1, col + index + 1] = val
      end
    end

    def export_header(array)
      export_row(0, 0, array)
    end

    def save
      @export_sheet.save
    end
  end
end
