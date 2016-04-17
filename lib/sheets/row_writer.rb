module Sheets
  class RowWriter
    def export_row(row, col, arr)
      raise 'Subclass should override export row'
    end
    def export_keys(array)
    # Not required
    end

    def export_header(array)
      # Not required
    end
  end
end