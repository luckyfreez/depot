require 'test_helper'

def new_product(attrs={})
  attributes = { :title => "something",
                 :price => 9,
                 :description => "I love you",
                 :image_url => "6.jpg"}.merge(attrs)
  Product.new(attributes)
end

class ProductTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "image url" do
    validUrl = %w{blah.jpg b.png i.gif gif.jpg}
    invalidUrl = %w{blah.pgn jpg.1 blajpg}
    validUrl.each do |url|
      product1 = new_product(:image_url => url)
      assert product1.valid?, "product with image_url = #{url} shouldn't be invalid"
    end
    invalidUrl.each do |url|
      assert new_product(:image_url => url).invalid?, "product with image_url = #{url} shouldn't be valid"
    end
  end

  test "uniqueness of title" do
    product1 = new_product
    product1.save
    product2 = new_product(:title => product1.title)
    product3 = new_product(:title => "something else")
    assert product2.invalid?, "Products with same titles cannot be created."
    assert product3.valid?, "Products with unique titles should have been valid to create."
  end
end
