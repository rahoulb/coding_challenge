require_relative './item'
require_relative './promotional_rules'
class Checkout
  def initialize rules = nil
    @rules = rules || DefaultRules.new
    @scanned_items = []
  end

  def scan item
    @scanned_items << item
  end

  def total
    sub_total = @rules.calculate_total_for(@scanned_items)
    percentage_discount = @rules.calculate_discount_for(sub_total)

    return (sub_total * (100.0 - percentage_discount)/100.0).to_f.round(2)
  end

  private
  class DefaultRules
    def calculate_total_for items
      sub_total = items.inject(0.0) do |sub_total, item|
        sub_total += item.price
      end
    end

    def calculate_discount_for items
      return 0.0
    end
  end

end
