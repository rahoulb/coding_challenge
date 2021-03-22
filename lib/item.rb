class Item < Struct.new(:code, :description, :price)
  def to_s
    self.description
  end

  class << self
    def item_001
      @item_001 ||= Item.new('001', 'Lavender Hearts', 9.25)
    end
    def item_002
      @item_002 ||= Item.new('002', 'Personalised cufflinks', 45.0)
    end
    def item_003
      @item_003 ||= Item.new('003', 'Kids T-Shirt', 19.95)
    end
  end
end
