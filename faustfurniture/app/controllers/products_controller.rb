require 'pry'
class ProductsController < ApplicationController
    before_action :load_all_products, only: [:view, :list, :category]
  include ProductsHelper
  include CategoriesHelper

  def list 
    @products = applyClearance(@products)
  end

  def view
    find_product
  end

  def category
    @products = applyClearance(@products)
    @products = fetchProductsByCategory(@products, params[:category])
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
