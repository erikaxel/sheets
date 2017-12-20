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

    def export_objects(objects, mapping)
      export_header(mapping.values)

      objects.each_with_index do |object, row|
        export_row(row + 1, 0, object_to_arr(object, mapping))
      end

    end

    def object_to_arr(object, mapping)
      arr = []
      mapping.each do |key, _value|
        arr << object.public_send(key)
      end
      arr
    end
  end
end
