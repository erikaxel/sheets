module Sheets
  class RowReader
    def import_row(_row)
      raise 'Subclass should override get_row'
    end

    def num_rows
      raise 'Subclass should override num_rows'
    end

    def as_date(_date)
      raise 'Subclass should override as_date'
    end
  end
end
