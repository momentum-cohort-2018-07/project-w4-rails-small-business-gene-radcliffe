require 'csv'
module ProductsHelper

    def applyClearance(products)
      
      
        for product in products
            if isAverageCondition?(product) then
                old_price = product.price
                new_price = old_price - (old_price * (0.20))
                product.discount_price = new_price
                product.isClearance = true
            end
            
        end   
       
        for product in products
            if isGoodCondition?(product) then
                old_price = product.price
                new_price = old_price - (old_price * (0.20))
                product.discount_price = new_price
                product.isClearance = true
            end            
        end 
        products
    end

    def isAverageCondition?(product)
        product.condition=="average" ? true : false
    end
    def isGoodCondition?(product)
        product.condition=="good" ? true : false
    end
    def fetch_average_condition(products)
        average_products=[]
        
        for product in products
            if product.condition == "average" then
                average_products<< product
            end
        end

        #return a list of average products
        average_products
    end

    def fetch_good_condition(products)
        good_products=[]
    
    
        for product in products
            if product.condition == "good" then
                good_products<< product
            end
        end

        #return a list of average products
        good_products
    end
    def get_products
        products=[]
        CSV.foreach('faust_furniture/data-import/faust_inventory.csv', headers:true) do |row|
            product = Product.new
            product.pid = row.to_h["pid"]
            product.item = row.to_h["item"]
            product.description = row.to_h["description"]
            product.price = row.to_h["price"].to_f
            product.condition = row.to_h["condition"]
            product.dimension_w = row.to_h["dimension_w"]
            product.dimension_l = row.to_h["dimension_l"]
            product.dimension_h = row.to_h["dimension_h"]
            product.img_file = row.to_h["img_file"]
            product.quantity = row.to_h["quantity"]
            product.category = row.to_h["category"] 
            product.isClearance = false    
            products << product
        end
        products
    end

    def get_product_categories
        

    end
    def fetch_clearance_items(products)
        clearance_items =[]
        average_condition = fetch_average_condition(products)
        for product in average_condition
            old_price = product.price
            new_price = old_price - (old_price * (0.20))
            product.discount_price = new_price
            product.isClearance = true
        end   
        good_condition = fetch_good_condition(products)
        for product in good_condition
            old_price = product.price
            new_price = old_price - (old_price * (0.20))
            product.discount_price = new_price
            product.isClearance = true
        end 
        clearance_items = average_condition + good_condition
    end

end
