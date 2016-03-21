require_relative '../lib/currency.rb'


class UnknownCurrencyCodeError < StandardError
  def message
    "That's an unknown currency."
  end
end

class CurrencyConverter
  attr_reader :exchange_rates

  def initialize (exchange_rates)
    @exchange_rates = exchange_rates
  end

  def convert(currency,code)
    currency_amount = currency.amount
    currency_code = currency.code
    new_code = code
    currency_rate1 = @exchange_rates.fetch(new_code)
    currency_rate2 = @exchange_rates.fetch(currency_code)
    if @exchange_rates.key?(new_code)
      converted_amount = (currency_rate1/currency_rate2) * currency_amount
    else
      raise UnknownCurrencyCodeError
    end
  end

end
