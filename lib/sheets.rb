require 'sheets/version'
require 'sheets/row_writer'

begin
  require 'rubyXL'
  require 'rubyXL/convenience_methods'
  require 'sheets/xlsx_writer'
  require 'sheets/xlsx_row_reader'
rescue LoadError
  # Noop
end

begin
  require 'google/apis'
  require 'google_drive'
  require 'sheets/google_drive_writer'
  require 'sheets/google_drive_row_reader'
rescue LoadError
  # Noop
end

begin
  require 'elasticsearch'
  require 'sheets/elastisearch_writer'
rescue LoadError
  # Noop
end

module Sheets
end
