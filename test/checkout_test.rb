require 'minitest/autorun'
require 'mocha/minitest'
require_relative '../lib/checkout'

describe Checkout do
  let(:first_product) { stub code: '001', description: 'First', price: 2.5 }
  let(:second_product) { stub code: '002', description: 'Second', price: 3.5 }
  let(:second_product_with_adjusted_price) { stub code: '002', description: 'Second', price: 3.0 }
  let(:third_product) { stub code: '003', description: 'Third', price: 8.0 }

  describe "calculating prices" do
    subject { Checkout.new }
    let(:first_product) { stub code: '001', description: 'First', price: 2.5 }
    let(:second_product) { stub code: '002', description: 'Second', price: 3.5 }

    it "sums the prices of items in the basket" do
      subject.scan first_product
      subject.scan second_product

      _(subject.total).must_equal 6.0
    end
  end

  describe "discounts" do
    subject { Checkout.new rules }
    let(:rules) { stub_everything }
    let(:items) { [first_product, third_product] }

    before do
      rules.expects(:calculate_discount_for).returns(10)
    end

    it "applies a 10% discount" do
      subject.scan first_product
      subject.scan third_product
      # 2.5 + 8 = 10.5
      # with a 10% discount = 9.45

      _(subject.total).must_equal 9.45
    end
  end

  describe "special offer prices" do
    subject { Checkout.new rules }
    let(:rules) { stub_everything }
    let(:items) { [second_product, second_product] }
    let(:adjusted_items) { [second_product_with_adjusted_price, second_product_with_adjusted_price] }

    before do
      rules.expects(:adjust_prices_within).returns(adjusted_items)
    end

    it "uses special offer pricing" do
      subject.scan second_product
      subject.scan second_product

      _(subject.total).must_equal 6.0
    end
  end
end
