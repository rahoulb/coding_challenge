# Checkout

This checkout takes items, scans them, then applies a discounted price
for Lavender Hearts (code 001) if you buy 2 or more.  And also applies a
general 10% discount if your total spend if above 60.0

USAGE:
```
  co = Checkout.new(promotional_rules)
  co.scan(item)
  co.scan(item)
  price = co.total
```

