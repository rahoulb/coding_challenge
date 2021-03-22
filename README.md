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

## About Docker
Implementation note: I couldn't get Ruby 2.6.6 to install on my machine
(I use RBEnv and it only had 2.6.0pre for some reason) - so I used
Docker to install it.  However, I did most of the work in Ruby 2.5.1 as
no Ruby 2.6 specific features were used. 

To use on a standard command line just run
`bundle exec ruby test/integration_test.rb`

To run in docker use
`docker build .`
