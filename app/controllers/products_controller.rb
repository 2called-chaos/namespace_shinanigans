class ProductsController < ApplicationController
  def index
    @products = Product.all

    # init search model
    @search = ::ContentFilterSearch::Product.new(params[:content_filter_search_product] || {})

    # This is false, it is a Product from the main namespace, why?
    # raise ::ContentFilterSearch::Product.is_a?(ContentFilterSearch).inspect

    # undefined method apply for Product
    @products = @search.apply(@products)
  end
end
