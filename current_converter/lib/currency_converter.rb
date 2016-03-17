class CurrenyConverter

  def initialize(code,rate)
    @USD_vs_CAD = Hash.new{:USD => 1.00, :CAD => 1.30}
  end

  def converter
  end
end
