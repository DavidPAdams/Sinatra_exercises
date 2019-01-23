require_relative "c_cipher"

get '/caesar_cipher' do
  if params['action'] == 'Reset'
    params["raw_string"], params["heat"]  = nil
  end

  raw_string = params["raw_string"]
  heat = params["heat"].to_i
  if raw_string && heat
    @well_done = caesar_cipher(raw_string, heat)
  else
    @well_done = ""
  end
  erb :'caesar_cipher/index', locals: { raw_string: raw_string, coded: @well_done, heat: heat}, layout: :'caesar_cipher/layout' 
end
