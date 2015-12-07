require 'spec_helper'

describe Sheets do
  context 'Google Drive writer' do
    it 'can init, write a row and save' do
      session = GoogleDrive.saved_session("./stored_token.json", nil, ENV['OAUTH_CLIENT_ID'], ENV['OAUTH_CLIENT_SECRET'])
      writer = Sheets::GoogleDriveWriter.new(session, '1CpUoHOTXzfRqQqB5cwP1O5BLVLWwOJTVji5gZzbDwpI')
      writer.export_row(0, 0, %w(val1 val2 val3))
      writer.save
      # FileUtils.rm('testdata.xlsx')
    end

  end
end