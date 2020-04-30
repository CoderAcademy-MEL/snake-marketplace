class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_user_listing, only: [:edit, :update, :destroy]

  def index
    @listings = Listing.all
    if !session[:count]  
      session[:count] = 1
    else
      session[:count] += 1
    end
  end

  def show
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.create(listing_params)
    if @listing.errors.any?
      render :new
    else
      flash[:success] = "You successfully created a new listing!"
      redirect_to @listing
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

  def set_user_listing
    id = params[:id]
    @listing = current_user.listings.find_by_id(id)
    if @listing == nil
      flash[:unauthorized] = "Not authorized! ❌"
      redirect_to listings_path
    end
  end
end
