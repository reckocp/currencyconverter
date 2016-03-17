require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/currency.rb'

class CurrencyTest < Minitest::Test

  def test_currency_class_exist
    assert Currency.new(20, "USD")
  end

  def test_amount
    currency = Currency.new(20, "USD")
    assert_equal(20, currency.amount)
  end

  def test_code
    usd_test = Currency.new(20,"USD")
    assert_equal("USD", usd_test.code)
  end

  def compare_test
    currency1 = Currency.new(20,"USD")

    currency2 = Currency.new(20,"USD")
    assert_equal(currency1, currency2)

    currency3 = Currency.new(20,"CAD")
    refute_equal(currency1, currency3)

    currency4 = Currency.new(40,"USD")
    refute_equal(currency1, currency4)

    currency5 = Currency.new(50,"CAD")
    refute_equal(currency1,currency5)
  end

  def test_is_same_code_add
    currency1 = Currency.new(20,"USD")
    currency2 = Currency.new(40,"USD")
    currency3 = Currency.new(60,"USD")
    assert_equal(currency3, currency1 + currency2)

    currency4 = Currency.new(50,"CAD")
    assert_raises DifferentCurrencyCodeError do
      currency1 + currency4
    end
  end

  def test_is_same_code_add
    currency1 = Currency.new(20,"USD")
    currency2 = Currency.new(40,"USD")
    currency3 = Currency.new(60,"USD")
    assert_equal(currency3, currency1 + currency2)

    currency4 = Currency.new(50,"CAD")
    assert_raises DifferentCurrencyCodeError do
      currency1 + currency4
    end
  end
end
