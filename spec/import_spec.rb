require 'spec_helper'

describe 'POST /import' do
  it 'importa arquivo CSV' do
    post '/import', Rack::Test::UploadedFile.new('test.csv', 'text/csv')
    expect(last_response).to be_ok
    expect(last_response.body).to eq('Importação bem sucedida')
  end
end
