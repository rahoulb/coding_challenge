class Checkout
  def initialize
    @scanned_items = []
  end

  def scan item
    @scanned_items << item
  end

  def total
    @scanned_items.inject(0.0) do |total, item|
      total += item.price
    end
  end

end
