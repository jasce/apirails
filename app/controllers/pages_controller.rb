class PagesController < ApplicationController
  def home
  end

  def storelistings
  	@stores =  Store.all.order("created_at DESC").sample(8)
  end

  def howitworks
  end
end