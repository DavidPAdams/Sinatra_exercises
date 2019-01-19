require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'caesar_cipher/caesar_cipher'
require_relative 'number_guess/number_guesser'
require_relative 'word_guess/word_guess'

enable :sessions

get '/' dor
  erb :index
end
