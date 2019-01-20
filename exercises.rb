require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'caesar_cipher/application'
require_relative 'number_guess/application'
require_relative 'word_guess/application'

enable :sessions

get '/' do
  erb :index
end
