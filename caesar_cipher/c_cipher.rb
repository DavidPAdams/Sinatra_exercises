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
