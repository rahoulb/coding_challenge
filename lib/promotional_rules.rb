class PromotionalRules
  def calculate_discount_for sub_total
    sub_total = sub_total.to_f
    (sub_total >= 60.0) ? 10.0 : 0.0
  end

  def calculate_total_for items
    return 0.0 if items.nil?
    items.inject(0.0) do | t, i |
      t += i.price.to_f
    end
  end
end
