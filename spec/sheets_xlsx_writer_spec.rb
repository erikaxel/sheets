require 'spec_helper'

describe Sheets do
  context 'XLSX writer' do
    it 'can init, write a row and save' do
      writer = Sheets::XlsxWriter.new('testdata.xlsx')
      writer.export_row(0, 0, %w(val1 val2 val3))
      writer.save
      FileUtils.rm('testdata.xlsx')
    end

  end
end