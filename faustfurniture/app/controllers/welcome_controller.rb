class WelcomeController < ApplicationController
  include CategoriesHelper
  def index
    @categories_hash={:tables => "tables",:seating => "seating",:bedroom => "bedroom", :storage=>"storage",:desks=>"desks",:miscellaneous=> "miscellaneous"}
    @categories = ["tables","seating","bedroom", "storage","desks", "miscellaneous"]
  end
end
