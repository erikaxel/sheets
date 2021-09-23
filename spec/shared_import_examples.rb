require 'bigdecimal'

RSpec.shared_examples 'row reader' do
  it 'can read a row' do
    row1 = @reader.import_row(0)
    row2 = @reader.import_row(1)
    expect(row1).to match_array(%w[col1 col2 col3])
    expect(row2).to match_array(%w[test1 test2 test3])
  end

  it 'can read a numerical row' do
    row1 = @reader.import_row(2)
    row2 = @reader.import_row(3)
    expect(row1).to match_array([1, 2, 3])
    expect(row2).to match_array([BigDecimal('2.2', 0),
                                 BigDecimal('2.3', 0),
                                 BigDecimal('2.4', 0)])
  end

  it 'can read a date row' do
    row3 = @reader.import_row(4)
    val = if row3[0].is_a? Float
            @reader.as_date(row3[0])
          else
            row3[0]
          end
    expect(val).to eq DateTime.new(2015, 2, 1)
  end

  it 'returns the correct number of rows' do
    expect(@reader.num_rows).to eq 5
  end
end
