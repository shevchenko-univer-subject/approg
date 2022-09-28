class NonStringParameterError < StandardError
  def initialize(param)
    msg = "The passed parameter '#{param.inspect}' is not the String object"
    super(msg)
  end
end

def alphabet_position(str)
  raise NonStringParameterError.new(str) unless str.is_a? String 

  str.downcase.bytes.select do |b|
    b.between?('a'.bytes.first, 'z'.bytes.first)
  end.map do |b|
    b - 96
  end.join(' ')
end
