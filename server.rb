require 'sinatra'
require 'rack/handler/puma'
require 'pg'
require 'json'
require './jobs/import_csv_job'
require 'byebug'

set :public_folder, 'public'

def db_connection
  PG.connect(dbname: 'postgres', user: 'postgres', password: 'password', host: 'db')
end

get '/tests/:token' do
  token = params['token']
  result = db_connection.exec_params('SELECT * FROM exams WHERE token_resultado_exame = $1', [token])
  result.map { |result| result.to_h }.to_json
end

get '/tests' do
  results = db_connection.exec('SELECT * FROM exams')
  results.map { |result| result.to_h }.to_json
end

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

post '/import' do
  csv_content = request.body.read
  ImportCsvJob.perform_async(csv_content)

  [200, 'Importação bem sucedida']
end

if __FILE__ == $0
  Rack::Handler::Puma.run(
    Sinatra::Application,
    Port: 3000,
    Host: '0.0.0.0'
  )
end
