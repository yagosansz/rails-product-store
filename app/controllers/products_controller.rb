class ProductsController < ApplicationController

	before_action :set_product, only: [:edit, :update, :destroy]

	def index
		@products = Product.order(name: :asc).limit(10)
		@product_with_discount = Product.order(:price).limit(1)
	end

	def new 
		@departments = Department.all
		@product = Product.new
	end

	def create
		@departments = Department.all

        @product = Product.new(product_params)

        if (@product.save)
        	flash[:notice] = "Product was successfully saved."
        	redirect_to(root_path)
        else
        	render :new
        end
	end

	def edit
		@departments = Department.all
		render :update
	end

	def update
		if @product.update(product_params)
			flash[:notice] = "Product was successfully updated!"
			redirect_to(root_path)
		else
			render :update
		end
	end

	def destroy
		@product.destroy
		redirect_to(root_path)
	end

	def search
		@name = params[:name]
		@products = Product.where("name like ?", "%#{@name}%")
	end

	private # all methods bellow refer only to the controller

	def product_params
		params.require(:product).permit(:name, :description, :price, :quantity, :department_id)
	end

	def set_product
		@product = Product.find(params[:id])
	end

end
