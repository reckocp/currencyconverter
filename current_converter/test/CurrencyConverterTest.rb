require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/currency_converter.rb'

class CurrencyConverterTest < Minitest::Test

  def test_currency_conv_exist
    exchange_rates = {}
    currency_converter1 = CurrencyConverter.new(exchange_rates)
    assert currency_converter1

    assert_equal(exchange_rates, currency_converter1.exchange_rates)
  end

  def test_currency_hash_exist
    exchange_rates = {USD: 1.0, CAD: 1.3}
    currency_converter1 = CurrencyConverter.new(exchange_rates)
    assert_equal(exchange_rates, currency_converter1.exchange_rates)
  end

  def test_currency_conversion
    test_currency = Currency.new(10, :USD)
    code = :CAD
    exchange_rates = {USD: 1.0, CAD: 1.3}
    currency_converter1 = CurrencyConverter.new(exchange_rates)
    assert(currency_converter1.convert(test_currency, code))
  end

  def test_currency_conversion_3
    test_currency = Currency.new(300, :JPY)
    code = :USD
    exchange_rates = {USD: 1.0, EUR: 0.74, JPY: 120.0}
    currency_converter1 = CurrencyConverter.new(exchange_rates)
    yentousd = (currency_converter1.convert(test_currency, code))
    assert_equal(2.5, yentousd)
  end

  def test_error_message
    test_currency = Currency.new(300, :INR)
    code = :USD
    exchange_rates = {USD: 1.0, EUR: 0.74, JPY: 120.0}
    currency_converter1 = CurrencyConverter.new(exchange_rates)
    inrtousd = (currency_converter1.convert(test_currency, code))
    assert_raise UnknownCurrencyCodeError do
    end
  end
end
