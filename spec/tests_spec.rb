require 'spec_helper'

describe 'GET /tests' do
  it 'retorna lista de testes' do
    get '/tests'
    expect(last_response).to be_ok
    expect(JSON.parse(last_response.body)).to be_an_instance_of(Array)
  end
end
