class PagesController < ApplicationController
  def home
  end

  def storelistings
  	@stores =  Store.where('(verified = ?)',true).all.order("created_at DESC").sample(8)
  end

  def howitworks
  end
  def contact
  end
  
  def faq  	
  end

  def success_password_changed    
  end
end