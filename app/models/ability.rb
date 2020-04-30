# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can [:index, :show, :new, :create], Listing
    can [:edit, :update, :destroy], Listing, user_id: user.id
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> 1a12abd26f8d15c38de83db6093a292144171a44
