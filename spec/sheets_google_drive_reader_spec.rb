require 'spec_helper'

describe Sheets do
  context 'Google Drive reader - Norsk' do
    before do
      session = GoogleDrive.saved_session('./stored_token.json', nil, ENV['OAUTH_CLIENT_ID'], ENV['OAUTH_CLIENT_SECRET'])
      @reader = Sheets::GoogleDriveRowReader.new(session, ENV['TEST_SHEET'], 'import_test')
    end

    it_behaves_like 'row reader'
  end

  context 'Google Drive reader - English' do
    before do
      session = GoogleDrive.saved_session('./stored_token.json', nil, ENV['OAUTH_CLIENT_ID'], ENV['OAUTH_CLIENT_SECRET'])
      @reader = Sheets::GoogleDriveRowReader.new(session, ENV['ENGLISH_TEST_SHEET'], 'import_test')
    end

    it_behaves_like 'row reader'
  end
end
