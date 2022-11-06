module TopUniqWords
  def search_toppest_words(str)
    REGEX_WITHOUT_KOVICHKA = /\!\@\#\$\%\^\&\*\(\)\_\+\-\=\|\"\;\:\/\\\>\<\,\.\?\`\~\[\]\{\}\№/
    str.split(REGEX_WITHOUT_KOVICHKA).each do |word|
      p word
    end
  end
end

include TopUniqWords

search_toppest_words("lsdj&f lijs o;fijsofjs/dj flisjdfo j'kjdhf,s  kjshdfshfk")