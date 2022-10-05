module BracketBalancer

  OPENING_BRACKETS = '([{<'
  CLOSING_BRACKETS = ')]}>'

  def brackets_balanced?(str)
    begin
      brackets_balanced_logic(str)
    rescue NoMethodError => e
      'param need to be String'
    end
  end

  private
    def brackets_balanced_logic(str)
      stack = []
      str.split('').each do |bracket|
        if is_opening?(bracket)
          stack.push(bracket) 
        elsif is_closing?(bracket) 
          next stack.pop if balancing?(stack.last, bracket)
          return false
        end
      end
      stack.empty?
    end

    def is_closing?(bracket)
      CLOSING_BRACKETS.include?(bracket)
    end

    def is_opening?(bracket)
      OPENING_BRACKETS.include?(bracket)
    end

    def balancing?(open_bracket, close_bracket)
      return false if open_bracket.nil?
      OPENING_BRACKETS.index(open_bracket) == CLOSING_BRACKETS.index(close_bracket)
    end
end

include BracketBalancer

p brackets_balanced?("(){}")
p brackets_balanced?("{({{}})}")
p brackets_balanced?('{}{')