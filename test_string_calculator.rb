require 'minitest/autorun'
 require_relative 'string_calculator'
 
 class TestStringCalculator < Minitest::Test
   def test_empty_string
     assert_equal(0, StringCalculator.add(""))
   end
 
   def test_single_number
     assert_equal(1, StringCalculator.add("1"))
   end
   def test_two_numbers
       assert_equal(3, StringCalculator.add("1,2"))
   end
   
   def test_multiple_numbers
       assert_equal(15, StringCalculator.add("1,2,3,4,5"))
   end
 
   def test_newline_separator
     assert_equal(6, StringCalculator.add("1\n2,3"))
   end
   
   def test_custom_delimiter
     assert_equal(3, StringCalculator.add("//;\n1;2"))
   end

   def test_custom_delimiter_with_newline
		assert_equal(6, StringCalculator.add("//|\n1|2\n3"))
		end

    def test_ignore_numbers_greater_than_1000
      assert_equal(2, StringCalculator.add("2,1001"))
    end

    def test_only_large_numbers_returns_zero
      assert_equal(0, StringCalculator.add("1001,1002,2000"))
    end
   
    def test_negative_numbers_raise_exception
      error = assert_raises(RuntimeError) { StringCalculator.add("1,-2,3,-4") }
			assert_match "negative numbers not allowed -2,-4", error.message
    end
 end
   