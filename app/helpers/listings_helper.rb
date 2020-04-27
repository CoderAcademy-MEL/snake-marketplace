module ListingsHelper
  def background_image(listing)
    return "
      background: url(#{url_for(listing.picture)});
      height: 100%; 
      background-position: center; 
      background-size: cover;
    "
  end
end
