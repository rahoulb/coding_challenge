class Checkout
  def initialize rules = nil
    @rules = rules
    @scanned_items = []
  end

  def scan item
    @scanned_items << item
  end

  def total
    items = @rules&.adjust_prices_within(@scanned_items) || @scanned_items

    sub_total = items.inject(0.0) do |sub_total, item|
      sub_total += item.price
    end
    return sub_total if @rules.nil?

    percentage_discount = @rules.calculate_discount_for(items) || 0.0
    return (sub_total * (100.0 - percentage_discount)/100.0)
  end

end
