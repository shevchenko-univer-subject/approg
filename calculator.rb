module Calculator 
  module Errors
    class NoOperationSpecified < StandardError
      def initialize(param)
        msg = "Unable to find a math operation"
        super(msg)
      end
    end

    class NonStringParameter < StandardError
      def initialize(param)
        msg = "The passed parameter '#{param.inspect}' is not the String object"
        super(msg)
      end
    end

    class NonSavedEval < StandardError
      def initialize(param)
        msg = "Forbidden characters in the transmitted String"
        super(msg)
      end
    end
  end

  def calculate(str)
    begin 
      raise Errors::NonStringParameter.new(str)   unless str.is_a? String
      raise Errors::NonSavedEval.new(str)         unless saved_eval?(str)
      raise Errors::NoOperationSpecified.new(str) unless has_operation?(str)

      eval(str)
    rescue Errors::NonStringParameter
      'Errors::NonStringParameter was raised'
    rescue Errors::NonSavedEval
      'Errors::NonSavedEval was raised'
    rescue Errors::NoOperationSpecified
      'Errors::NoOperationSpecified was raised'
    rescue SyntaxError
      'SyntaxError was raised'
    rescue NameError
      'NameError was raised'
    rescue ZeroDivisionError
      'ZeroDivisionError was raised'
    end
  end

  private

    def saved_eval?(str)
      !str.match?(/[^0-9+*.\/\-\(\)\ ]/)
    end

    def has_operation?(str)
      comparetive_str = str.to_i.to_s
      comparetive_str != str.chomp
    end
end

include Calculator
