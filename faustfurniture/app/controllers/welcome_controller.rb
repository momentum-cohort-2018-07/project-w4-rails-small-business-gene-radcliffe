class WelcomeController < ApplicationController
  include CategoriesHelper
  def index
    
    @categories = ["tables","seating","bedroom", "storage","desks", "miscellaneous"]
  end
end
