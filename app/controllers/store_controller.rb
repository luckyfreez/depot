class StoreController < ApplicationController
  def index
    @counter = counter
    @products = Product.all
    
 @cart = current_cart 

  end

end
