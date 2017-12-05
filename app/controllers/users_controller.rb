class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users.to_json(except: :password_digest)
  end

  def create
    @user = User.new(email: params[:email], password: params[:password], name: params[:name])
    @user.save
  end

  def show
    @user = User.find(params[:id])
    render json: @user.to_json(except: :password_digest)
  end

end
