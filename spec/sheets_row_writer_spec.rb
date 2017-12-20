require 'spec_helper'

describe Sheets::RowWriter do
  let(:writer) { Sheets::RowWriter.new }

  describe '#object_to_arr' do
    it 'can map a simple object' do
      book = OpenStruct.new(title:  "The RSpec Book", subtitle: 'Behaviour-Driven Development with RSpec...' )

      arr = writer.object_to_arr(book, {title: 'Tittel'})
      expect(arr.size).to eq 1
      expect(arr[0]).to eq 'The RSpec Book'

      arr = writer.object_to_arr(book, {title: 'Tittel', subtitle: 'Undertittel'})
      expect(arr.size).to eq 2
      expect(arr[0]).to eq 'The RSpec Book'
      expect(arr[1]).to eq 'Behaviour-Driven Development with RSpec...'
    end
  end

  describe '#export_objects' do
    it 'can write simple objects' do
      allow(writer).to receive(:export_row)
      expect(writer).to receive(:export_row).with(1, 0, ["The RSpec Book", 'Behaviour-Driven Development with RSpec...'])
      expect(writer).to receive(:export_row).with(2, 0, ["Learn Ruby the Hard Way", '3rd Edition'])

      books = [
        OpenStruct.new(title:  "The RSpec Book", subtitle: 'Behaviour-Driven Development with RSpec...' ),
        OpenStruct.new(title:  "Learn Ruby the Hard Way", subtitle: '3rd Edition' )
      ]

      writer.export_objects books, {title: 'Tittel', subtitle: 'Undertittel'}
    end
  end
end
