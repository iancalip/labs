require 'spec_helper'

describe 'GET /tests/:token' do
  it 'retorna um teste com token específico' do
    get '/tests/T9O6AI'
    expect(last_response).to be_ok
    expect(JSON.parse(last_response.body)).to be_an_instance_of(Array)
  end
end
