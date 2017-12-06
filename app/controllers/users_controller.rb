class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users.to_json(except: :password_digest)
  end

  def create
    @user = User.new(email: params[:email], password: params[:password], name: params[:name])
    if @user.save
      head 200
    else
      head 403
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user.to_json(except: :password_digest)
  end

end
