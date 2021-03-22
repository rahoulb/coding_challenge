require 'minitest/autorun'
require 'mocha/minitest'
require_relative '../lib/checkout'

describe "Full Checkout Test" do
  let(:rules) { PromotionalRules.new }
  let(:checkout) { Checkout.new(rules) }

  it "calculates the price for all three items" do
    checkout.scan Item.item_001
    checkout.scan Item.item_002
    checkout.scan Item.item_003

    _(checkout.total).must_equal 66.78
  end

  it "includes a discount for lavender hearts" do
    checkout.scan Item.item_001
    checkout.scan Item.item_003
    checkout.scan Item.item_001

    _(checkout.total).must_equal 36.95
  end

  it "includes a 10% discount for spending more than £60" do
    checkout.scan Item.item_001
    checkout.scan Item.item_002
    checkout.scan Item.item_001
    checkout.scan Item.item_003

    _(checkout.total).must_equal 73.76
  end
end
