class PromotionalRules
  def calculate_discount_for sub_total
    sub_total = sub_total.to_f
    (sub_total >= 60.0) ? 10.0 : 0.0
  end
end
