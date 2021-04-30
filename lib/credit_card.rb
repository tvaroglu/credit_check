class CreditCard
  attr_reader :card_number, :limit

  def initialize(card_number='', limit=0)
    @card_number = card_number.to_s
    @limit = limit.to_i
    @@test_card_num = '5541808923795240'
  end

# Your Luhn Algorithm Here
  def luhn_algorithm(card_number=self.card_number)
    if card_number == '' || card_number.to_i == 0 || card_number == nil
      return "Error, please supply a valid card number to check"
    else
      check_arr = []

      iter_arr = card_number.to_s.split('')
      if iter_arr.length > 0 && iter_arr.length % 2 == 0
        double_even_indexes = true
      elsif iter_arr.length > 0 && iter_arr.length % 2 != 0
        double_odd_indexes = true
      end

      iter_arr.each_with_index do |char, index|
        if double_even_indexes
          if index % 2 == 0
            if char.to_i * 2 > 9
              digit_sum = (char.to_i * 2).to_s.split('').reduce(0) do |total, digit|
                total.to_i + digit.to_i
              end
              check_arr << digit_sum
            else
              check_arr << char.to_i * 2
            end
          else
            check_arr << char.to_i
          end
        elsif double_odd_indexes
          if index % 2 != 0
            if char.to_i * 2 > 9
              digit_sum = (char.to_i * 2).to_s.split('').reduce(0) do |total, digit|
                total.to_i + digit.to_i
              end
              check_arr << digit_sum
            else
              check_arr << char.to_i * 2
            end
          else
            check_arr << char.to_i
          end
        end
      end

      # Output
      check = check_arr.reduce(0) do |total, digit|
        total + digit
      end
      check_digit = (check * 9) % 10
      ## If it is valid, print "The number [card number] is valid!"
      if check % 10 == 0
        return "The number [#{card_number}] is valid! Checksum: [#{check}]; Checkdigit: [#{check_digit}]"
      ## If it is invalid, print "The number [card number] is invalid!"
      else
        return "The number [#{card_number}] is invalid! Checksum: [#{check}]; Checkdigit: [#{check_digit}]"
      end

    end
  end


  def self.test_card_number
    return @@test_card_num
  end

  def is_valid?()
    if luhn_algorithm(self.card_number).include?('is valid')
      return true
    else
      return false
    end
  end

  def last_four()
    return self.card_number.to_s[-4..-1]
  end

end



# p CreditCard.new.luhn_algorithm(CreditCard.test_card_number)
#
# additional_test_data = {
#   :valid_numbers => [5541808923795240, 4024007136512380, 6011797668867828],
#   :invalid_numbers => [5541801923795240, 4024007106512380, 6011797668868728]
# }
#
# all_valid = additional_test_data[:valid_numbers].all? do |number|
#   CreditCard.new(number).is_valid?
# end
# p all_valid
#
# all_invalid = additional_test_data[:invalid_numbers].all? do |number|
#   !CreditCard.new(number).is_valid?
# end
# p all_invalid
#
# puts '-' * 20
# cc = CreditCard.new('4024007136512380', 15000)
# p cc.card_number
# p cc.limit
# p cc.luhn_algorithm
# p cc.is_valid?
# p cc.last_four
#
# puts '-' * 20
# p cc.luhn_algorithm(342804633855673)
# p cc.luhn_algorithm(342801633855673)
