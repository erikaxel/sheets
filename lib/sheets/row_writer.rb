module Sheets
  class RowWriter
    def export_row(row, col, arr)
      raise 'Subclass should override export row'
    end
  end
end