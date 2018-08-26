require 'pry'
class ProductsController < ApplicationController
    before_action :load_all_products, only: [:view, :list]
  include ProductsHelper
  def list
   
    @products = applyClearance(@products)

  end

  def view
 
    find_product
  end

  private
  def load_all_products
   
    @products = get_products
   
  end

  def find_product
    @product
    
    for product in @products
      if product.pid == params[:id] then
        @product = product
      end
    end
    @product
  end
end
