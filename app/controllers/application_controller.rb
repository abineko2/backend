class ApplicationController < ActionController::API
  def hello_world
    render json: { text: "Hello World", message: "test", status: current_user_check? }
  end

  def current_user_check?
    status = false
    user = User.find_by( email: params[ :email ])
    if user&.authenticate(params[:password])
      status = true
    end
    return status
  end

end
