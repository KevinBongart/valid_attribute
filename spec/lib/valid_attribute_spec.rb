require "rails_helper"

describe "#valid_attribute?" do
  it "heyo" do
    company = Company.new
    product = Product.new(company: company, name: "heyo")

    expect(product.valid?).to be_falsey

    expect(product.valid_attribute?(:company)).to be_truthy
    expect(product.valid_attribute?(:name)).to be_truthy
    expect(product.valid_attribute?(:legacy_code)).to be_falsey

    expect(product.valid_attribute?(:company, :name)).to be_truthy
    expect(product.valid_attribute?(:company, :name, :legacy_code)).to be_falsey

    expect(product.valid_attribute?([:company, :name])).to be_truthy

    expect(product.valid_attribute?(name: :format)).to be_truthy
    expect(product.valid_attribute?(name: [:format, :uniqueness])).to be_truthy

    product = Product.new(company: company, name: "heyo&^%$")

    expect(product.valid_attribute?(name: :format)).to be_falsey
    expect(product.valid_attribute?(name: :uniqueness)).to be_truthy
    expect(product.valid_attribute?(name: [:format, :uniqueness])).to be_falsey
  end
end
