require 'sinatra'
require 'haml'

before do
  @year = Date.today.year
end

not_found do
  status(404)
  haml :not_found
end

get '/' do
  haml :index
end