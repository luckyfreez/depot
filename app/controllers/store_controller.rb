class StoreController < ApplicationController
  def index
    @counter = counter
    @products = Product.all
  end

end
