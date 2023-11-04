munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_pair do |_name, info|
  if info['age'] >= 65
    info['age_group'] = 'senior'
  elsif (info['age'] <= 64 && info['age'] >= 18)
    info['age_group'] = 'adult'
  else
    info['age_group'] = 'kid'
  end
end

p munsters