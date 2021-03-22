require 'minitest/autorun'
require 'mocha/minitest'
require_relative '../lib/promotional_rules'

describe PromotionalRules do
  subject { PromotionalRules.new }
  describe "discount" do
    it "of 10% is applied if the total is equal to or higher than 60" do
      _(subject.calculate_discount_for(60.0)).must_equal 10.0
      _(subject.calculate_discount_for(60.1)).must_equal 10.0
      _(subject.calculate_discount_for(6000)).must_equal 10.0
    end
    it "is not applied if the total is less than 60" do
      _(subject.calculate_discount_for(59.99)).must_equal 0.0
      _(subject.calculate_discount_for(10.0)).must_equal 0.0
      _(subject.calculate_discount_for(0)).must_equal 0.0
    end
  end

end
