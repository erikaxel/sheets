require 'spec_helper'

describe Sheets do
  context 'Google Drive writer' do
    it 'can init, write a row and save' do
      session = GoogleDrive.saved_session('./stored_token.json', nil, ENV['OAUTH_CLIENT_ID'], ENV['OAUTH_CLIENT_SECRET'])
      writer = Sheets::GoogleDriveRowWriter.new(session, ENV['TEST_SHEET'])
      writer.export_row(0, 0, %w[val1 val2 val3])
      writer.save
    end
  end
end
