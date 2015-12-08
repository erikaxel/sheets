module Sheets
  class RowReader
    def import_row(row)
      raise 'Subclass should override get_row'
    end
  end
end