require 'minitest/autorun'
require 'mocha/minitest'
require_relative '../lib/promotional_rules'

describe PromotionalRules do
  subject { PromotionalRules.new }
  let(:first_product) { stub code: '001', description: 'First', price: 2.5 }
  let(:second_product) { stub code: '002', description: 'Second', price: 3.5 }
  let(:third_product) { stub code: '003', description: 'Third', price: 8.0 }
  let(:items) { [first_product, second_product, third_product] }

  describe "calculating sub-total" do
    it "is the sum of the products supplied" do
      _(subject.calculate_total_for(items)).must_equal 14.0
    end
  end
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
