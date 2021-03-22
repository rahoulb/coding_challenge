class PromotionalRules
  def calculate_discount_for sub_total
    sub_total = sub_total.to_f
    (sub_total >= 60.0) ? 10.0 : 0.0
  end

  def calculate_total_for items
    return 0.0 if items.nil?

    # known issues with this code:
    # Not extensible - obviously hardcoded to 001, a count of 2 or more and a discount price of 8.50
    # also it will not produce an itemised invoice - as the original product will still be listed at the original price in the checkout
    apply_001_discount = (items.select { |i| i.code == '001' }.count > 1)
    items.inject(0.0) do | t, i |
      if apply_001_discount && i.code == '001'
        t += 8.5
      else
        t += i.price.to_f
      end
      t
    end
  end
end
