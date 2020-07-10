class Admin::UsersController < ApplicationController
  before_action :require_admin 
  
  def index
    @users = User.all
    @member = current_user.member
  end  
  
  def show
    @user = User.find(params[:id]) 
  end  
  
  def new
    @user =User.new
    @user.build_member
    @member = current_user.member
  end

  def create 
    # @user =User.new(user_params)
    # @user =User.new(user_params).build_member
    # ユーザーとメンバーを同時に作成する
    @user =User.create(user_params)

    if @user.save
      redirect_to root_url, notice:"新規ユーザーを登録しました"
    else
      # redirect_to root_url, notice:"登録できません"
      @member = current_user.member
      render("admin/users/new")
    end  
  end
  
  private
  
  def require_admin
    redirect_to root_url unless current_user.admin?
  end  

  def user_params
    params.require(:user).permit(
      :name, 
      :email, 
      :admin, 
      :password, 
      :password_confirmation,
      member_attributes:[:id,
                        :enrollment,
                        :user_id]
                        )
  end


end
