module BracketBalancer
  module Errors
    class NoOperationSpecified < StandardError
      def initialize(param)
        msg = "Too long input string"
        super(msg)
      end
    end
  end

  OPENING_BRACKETS = '([{<'
  CLOSING_BRACKETS = ')]}>'

  def brackets_balanced?(str)
    begin
      raise Errors::NoOperationSpecified unless str.size <= 8
      brackets_balanced_logic(str)
    rescue NoMethodError => e
      'param should to be String'
    rescue NoOperationSpecified => e
      'You shold input string with len less 8'
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

p brackets_balanced?('{() dfd}')