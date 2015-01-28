require "rails_helper"

describe "#valid_attribute?" do
  it "validates one attribute" do
    company = Company.new
    product = Product.new(company: company, name: "A cool thing", legacy_code: "COOL_THING")

    expect(product.valid?).to be_falsey

    expect(product.valid_attribute?(:company)).to be_truthy
    expect(product.valid_attribute?(:name)).to be_truthy
    expect(product.valid_attribute?(:legacy_code)).to be_falsey
  end

  it "validates several attributes" do
    company = Company.new
    product = Product.new(company: company, name: "A cool thing", legacy_code: "COOL_THING")

    expect(product.valid?).to be_falsey

    expect(product.valid_attribute?(:company, :name)).to be_truthy
    expect(product.valid_attribute?([:company, :name])).to be_truthy
    expect(product.valid_attribute?(:company, :name, :legacy_code)).to be_falsey
  end

  it "validates on specific validators" do
    company = Company.new
    product_1 = Product.create(company: company, name: "A cool thing", legacy_code: "COOLTHING")
    product_2 = Product.new(company: company, name: "A cool thing", legacy_code: "COOL_THING")

    expect(product_2.valid?).to be_falsey

    expect(product_2.valid_attribute?(name: :format)).to be_truthy
    expect(product_2.valid_attribute?(name: :uniqueness)).to be_falsey
    expect(product_2.valid_attribute?(name: [:format, :uniqueness])).to be_falsey

    expect(product_2.valid_attribute?(legacy_code: :format)).to be_falsey
    expect(product_2.valid_attribute?(legacy_code: :uniqueness)).to be_truthy
    expect(product_2.valid_attribute?(legacy_code: [:format, :uniqueness])).to be_falsey

    expect(product_2.valid_attribute?(company: :presence, name: :format, legacy_code: :uniqueness)).to be_truthy
    expect(product_2.valid_attribute?(company: :presence, name: :format, legacy_code: [:format, :uniqueness])).to be_falsey
  end
end
