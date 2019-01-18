require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'caesar_cipher/'+whatever the app file is called
require_relative 'number_guess/'+whatever the app file is called
require_relative 'word_guess'+whatever the app file is called

enable :sessions

get '/' do
  erb :index
end
