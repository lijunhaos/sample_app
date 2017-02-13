class UsersController < ApplicationController
  #展示某个用户
  def show
    @user = User.find(params[:id])
  end

  #获取用户注册页面
  def new
    @user = User.new
  end

  #用户填写表单注册账号
  def create
    @user = User.new(user_params)
    if @user.save
      #处理注册成功的情况
      flash[:success]="Welcome to the Sample App!"
      redirect_to user_url @user
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
end
