class StringCalculator
	def self.add(numbers)
		return 0 if numbers.empty?
		delimiter = detect_delimiter(numbers)
		numbers = parse_numbers(numbers, delimiter)
		negatives = numbers.select { |num| num < 0 }
		raise "negative numbers not allowed #{negatives.join(',')}" if negatives.any?
		numbers.sum
	end

	def self.detect_delimiter(numbers)
		numbers[0] == '/' && numbers[1] == '/' ? numbers[2] : /[,\n]/
	end

	def self.parse_numbers(numbers, delimiter)
		numbers = numbers.gsub(%r{//\[.*?\]\n}, '') 
		numbers.split(delimiter).map(&:to_i)
	end
end