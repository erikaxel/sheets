module Sheets
  class RowReader
    def import_row(row)
      raise 'Subclass should override get_row'
    end

    def num_rows
      raise 'Subclass should override num_rows'
    end
  end
end