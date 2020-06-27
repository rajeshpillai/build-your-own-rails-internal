def describe (description, &block)
  puts description.upcase
  block.call
end

def it (description, &block)
  result = block.call
  if result
    puts "   It #{description.ljust(60,'.')} passed "
  else
    puts "   It #{description.ljust(60,'.')} failed"
  end
end

def is_equal(expected, actual)
  expected == actual
end