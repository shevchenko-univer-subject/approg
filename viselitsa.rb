def secret_word_for_user(word, litters)
  word.split('').map do |l|
    next l if litters.include?(l)
    '_'
  end.join('')
end

def user_win?(word, litters)
  collected = litters.split('').select do |l|
    l if word.include?(l)
  end
  collected.sort == word.split('').uniq.sort
end

def get_letter
  loop { 
    letter = STDIN.gets.chomp
    break letter unless letter.empty?
   }
end

dictionary = %w[lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum].uniq

secret_word = dictionary.sample
nonsecret_litters = ''
power_of_line = secret_word.split('').uniq.count + 2
status = nil

(power_of_line).times do |t| 
  p "Count of try is #{power_of_line - t}"
  p secret_word_for_user(secret_word, nonsecret_litters)
    
  letter = get_letter
  break status = "user win!!!" if letter.downcase == secret_word
  nonsecret_litters << letter[0]
  break status = "user win!!!" if user_win?(secret_word, nonsecret_litters)
end

p status unless status.nil?
p "user lose" unless user_win?(secret_word, nonsecret_litters)
