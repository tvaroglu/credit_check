require_relative 'credit_card'


welcome = "> Please enter a credit card number: "
continue = "> Would you like to validate another card number? (y/n): "
goodbye = 'Goodbye! Thank you for using the credit card validation tool.'


puts welcome
input_card_number = $stdin.gets.chomp

cc = CreditCard.new(input_card_number, 25000)


puts "> Would you like to validate the card number? (y/n): "
user_input = $stdin.gets.chomp
if user_input != 'y'
  continue
elsif user_input == 'y'
  puts cc.luhn_algorithm

  puts continue
  user_input = $stdin.gets.chomp

  until user_input != 'y'

    puts welcome
    new_validation = $stdin.gets.chomp
    puts cc.luhn_algorithm(new_validation)

    puts continue
    user_input = $stdin.gets.chomp

  end

end
puts goodbye
