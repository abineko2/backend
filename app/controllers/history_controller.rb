class HistoryController < ApplicationController
  def show
    user = User.find( params[:user_id] )
    render json: user.user_history
  end
end
