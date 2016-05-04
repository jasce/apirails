class WelcomesController < ApplicationController
  #before_action :set_welcome, only: [:show, :edit, :update, :destroy]

  # GET /welcomes
  # GET /welcomes.json
  def index
    @users = User.all.limit(4).order("created_at desc")
    @stores = Store.all.limit(4).order("created_at desc")
    @companies = BusinessCompany.all
    @individuals = BusinessIndividual.all
  end

  
end

