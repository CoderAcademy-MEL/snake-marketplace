class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def show
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to root_path
    else
      render :new
    end 
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      redirect_to root_path
    else
      render :edit
    end 
  end

  def destroy
    @listing.destroy
    redirect_to root_path
  end

  private 

  def listing_params
    params.require(:listing).permit(:title, :description, :breed_id, :picture)
  end 

  def set_listing 
    @listing = Listing.find(params[:id])
  end 
end
