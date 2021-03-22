require 'minitest/autorun'
require 'mocha/minitest'
require_relative '../lib/checkout'

describe Checkout do
  let(:first_product) { stub code: '001', description: 'First', price: 2.5 }
  let(:second_product) { stub code: '002', description: 'Second', price: 3.5 }
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
    let(:rules) { stub }
    let(:items) { [first_product, third_product] }

    before do
      rules.expects(:calculate_discount_for).with(items).returns(10)
    end

    it "applies a 10% discount" do
      subject.scan first_product
      subject.scan third_product
      # 2.5 + 8 = 10.5 
      # with a 10% discount = 9.45

      _(subject.total).must_equal 9.45
    end

  end


end
