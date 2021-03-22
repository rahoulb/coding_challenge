require 'minitest/autorun'
require 'mocha/minitest'
require_relative '../lib/promotional_rules'

describe PromotionalRules do
  subject { PromotionalRules.new }
  let(:first_product) { stub code: '001', description: 'Lavender Hearts', price: 9.25 }
  let(:second_product) { stub code: '002', description: 'Personalised cufflinks', price: 45.0 }
  let(:third_product) { stub code: '003', description: 'Kids T-Shirt', price: 19.95 }
  let(:items) { [first_product, second_product, third_product] }
  let(:discounted_items) { [first_product, first_product, second_product, third_product] }

  describe "calculating sub-total" do
    it "is the sum of the products supplied" do
      _(subject.calculate_total_for(items)).must_equal 74.2
    end
    it "applies an updated item price if multiple products with code 001 are added" do
      _(subject.calculate_total_for(discounted_items)).must_equal 81.95
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
