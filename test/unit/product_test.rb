require 'test_helper'

def new_product(attrs={})
  attributes = {:title => "Some title",
              :price => 3,
              :description => "I love you",
              :image_url => "6.jpg"}.merge(attrs)
  Product.new(attributes)
end

class ProductTest < ActiveSupport::TestCase
  # Replace this with your real tests.

  fixtures :products

  test "image url" do
    validUrl = %w{blah.jpg b.png i.gif gif.jpg}
    invalidUrl = %w{blah.pgn jpg.1 blajpg}
    validUrl.each {|url| 
      assert new_product(:image_url => url).valid?, "#{url} shouldn't be invalid"
    }
    invalidUrl.each do |url|
      assert new_product(:image_url => url).invalid?, "#{url} shouldn't be valid"
    end
  end

  test "uniqueness of title" do
    product1 = new_product
    product1.save
    product2 = new_product
    product3 = new_product(:title => "some else title")
    assert product2.invalid?, "product with same title shouldn't be valid to create"
    assert product3.valid?, "prodcut with unique title should be valid to create"
  end
end
