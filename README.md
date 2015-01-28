# valid_attribute

[![Circle CI](https://circleci.com/gh/KevinBongart/valid_attribute/tree/master.svg?style=svg)](https://circleci.com/gh/KevinBongart/valid_attribute/tree/master)

Let's say you have:

```ruby
class Product < ActiveRecord::Base
  belongs_to :company

  validates :company, presence: true
  validates :name, format: { with: /\A[a-zA-Z]+\z/ }
  validates :name, uniqueness: { scope: :company }
  validates :legacy_code, format: { with: /\A[a-zA-Z]+\z/ }
end
```

This gem lets you test the validity of each attribute independentely:

```ruby
company = Company.new
product = Product.new(company: company, name: "heyo")

# Test only one attribute:
product.valid_attribute?(:company)      # => true
product.valid_attribute?(:name)         # => true
product.valid_attribute?(:legacy_code)  # => false

# Test several attributes at once, like a boss:
product.valid_attribute?(:company, :name)               # => true
product.valid_attribute?(:company, :name, :legacy_code) # => false

# Wow, you can even filter down to a specific validator:
product.valid_attribute?(name: :format)                     # => true
product.valid_attribute?(name: [:format, :uniqueness])      # => true
product.valid_attribute?(name: :format, company: :presence) # => true
```

Time to go crazy:

```ruby
gem 'valid_attribute', github: 'kevinbongart/valid_attribute'
```
