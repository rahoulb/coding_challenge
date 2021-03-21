require 'minitest/autorun'
require 'mocha/minitest'
require_relative '../lib/checkout'

describe Checkout do
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

end
