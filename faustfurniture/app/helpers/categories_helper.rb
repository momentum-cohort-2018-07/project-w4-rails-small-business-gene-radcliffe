module CategoriesHelper


    def fetchProductsByCategory(products, category)
        productsByCategory = []
        for product in products
            if product.category == category then
                productsByCategory << product
            end 
        end

        productsByCategory
    end
end