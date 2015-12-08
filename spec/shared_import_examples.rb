RSpec.shared_examples 'row reader' do
  it 'can read a row' do
    row1 = @reader.import_row(0)
    row2 = @reader.import_row(1)
    expect(row1).to match_array(%w(col1 col2 col3))
    expect(row2).to match_array(%w(test1 test2 test3))
  end

  it 'can read a numerical row' do
    row1 = @reader.import_row(2)
    row2 = @reader.import_row(3)
    expect(row1).to match_array([1,2,3])
    expect(row2).to match_array([BigDecimal('2.2'), BigDecimal('2.3'), BigDecimal('2.4')])
  end

end