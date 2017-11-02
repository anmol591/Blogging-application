class ProductsController < ApplicationController
	before_action :authenticate_user!

	def new
		@product=Product.new
		@categories=Category.all
		
	end
	def create
		@product=Product.new(product_params)
		if @product.save
			flash[:notice]="Product added successfully"
			redirect_to :action=>'index'
		else
			flash.now[:error] = ""
			@product.errors.messages.each do |k,v|
				v.each do |msg|
				 flash.now[:error] += "<li>#{msg}</li>"		
				end
			 
			end  
			render :action=>'new'
		end

	end
	def show
		@product=Product.find(params[:id])
		
	end
	def edit
		@categories=Category.all
		@product=Product.find(params[:id])
		
	end
	def index
		@products=Product.all
		@categories=Category.all
		
	end
	def update
		
		@product=Product.find(params[:id])
		if (@product.update_attributes(product_params))
			flash[:notice]="Product updated successfully"
			redirect_to :action=>'show', :id=>@product
			
		else
			@categories=Category.all
			flash.now[:error] = ""
			@product.errors.messages.each do |k,v|
				v.each do |msg|
				 flash.now[:error] += "<li>#{msg}</li>"		
				end
			 
			end
			render :action=>'edit', :id=>@product
		end

		
	end
	def destroy
		@product=Product.find(params[:id])
		@product.destroy
		flash[:notice]="Product deleted successfully"
		redirect_to :action=>'index'
	end
	def product_params
		params.require(:product).permit(:name, :price, :category_id)
		
	end

end
