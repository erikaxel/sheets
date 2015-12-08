require 'spec_helper'

describe Sheets do
  context 'XLSX reader' do
    before do
      @reader = Sheets::XlsxRowReader.new('spec/data/import_test_data.xlsx', 0)
    end

    it_behaves_like 'row reader'

  end
end