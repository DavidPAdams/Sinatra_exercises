def caesar_cipher (raw_string, heat)

  rare_array = raw_string.codepoints

  med_array = []

  if heat > 26 || heat < -26
    heat = heat % 26
  end

  rare_array.each do |i|
    if ((97..122).include?(i) && (i+heat)>122) || ((65..90).include?(i) && (i+heat)>90)
      med = i + heat - 26
    elsif (97..122).include?(i + heat) || (65..90).include?(i + heat)
      med = i + heat
    else
      med = i
    end 
    med_array << med
  end
  @well_done = med_array.pack("C*")
end

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
