class UsersController < ApplicationController

  def create
    if current_user.create(user_params)
      redirect_to root_path
    else
      render :shared/error_messages
    end
  end
end
