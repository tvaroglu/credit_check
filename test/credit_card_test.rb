require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/credit_card'

class CreditCardTest < Minitest::Test
  def test_it_exists
    # skip
    cc = CreditCard.new
    assert_instance_of(CreditCard, cc)
  end

  def test_it_has_a_card_number
    # skip
    cc = CreditCard.new('5541808923795240', 25000)
    assert_equal('5541808923795240', cc.card_number)
  end

  def test_it_has_a_limit
    # skip
    cc = CreditCard.new('5541808923795240', 25000)
    assert_equal(25000, cc.limit)
  end

  def test_it_has_a_last_four_method
    # skip
    cc = CreditCard.new('5541808923795240', 25000)
    assert_equal('5240', cc.last_four)
  end

  def test_it_has_an_is_valid_method
    # skip
    cc = CreditCard.new('5541808923795240', 25000)
    assert_equal(true, cc.is_valid?)
  end
end
