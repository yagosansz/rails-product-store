class ProductsController < ApplicationController

	def index
		@products = Product.order(name: :asc).limit(5)
		@product_with_discount = Product.order(:price).limit(1)
	end

	def create
		product = params.require(:product).permit(:name, :description, :price, :quantity)
        Product.create(product)
        redirect_to(root_path)
	end

	def destroy
		id = params[:id]
		Product.destroy(id)
		redirect_to(root_path)
	end

	def search
		@name = params[:name]
		@products = Product.where("name like ?", "%#{@name}%")
	end

end
