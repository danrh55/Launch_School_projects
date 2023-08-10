def determine_missing_letter(strings)
  return [] if strings.empty?
  (strings[0]..strings[-1]).each do |string|
      p strings.include?(string)
      return string.swapcase if !(strings.include?(string))
    end
end

p determine_missing_letter(['o','p','r','s','t'])