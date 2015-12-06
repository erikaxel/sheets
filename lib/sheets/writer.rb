module Sheets
  class Writer
    def export_row(row, col, arr)
      raise 'Subclass should override export row'
    end
  end
end