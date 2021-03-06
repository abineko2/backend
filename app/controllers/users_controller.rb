class UsersController < ApplicationController
  before_action :current_user_check?
  
  def index
    if current_user_check?
      users = User.all.sort_user
      render json: users
    else
      render json: []
    end
    
  end

  def create
    user = User.new( user_parameter )
    if user.save
      render json: {message: '登録しました', userData: user.user_history}

    else
      render json: {message: '登録失敗しました。内容を確認してください'}
    end
  end

  def update
    user = User.find( params[:id] )
    if user.update_attributes( user_parameter )
      render json: {message: '編集しました'}
    else
      render json: {message: '編集失敗しました。内容を確認してください'}
    end
  end


  def show
    user = User.find( params[:id] )
    render json: user.user_history
  end

  def user_show
    user = User.find_by(name: params[:name] )
    render json: user.user_history
  end

  def destroy
    user = User.find( params[:id] )
    user.destroy
    render json: {message: '削除しました。'}
  end

private
  def user_parameter
    params.permit( :name, :email, :tel,  :password, :password_confirmation)
  end
  
  def set_user
    
  end
end
