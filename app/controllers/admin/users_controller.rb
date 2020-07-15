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
    # @member = current_user.member
    logger.debug "＊＊＊newデバッグログスタート"
    logger.debug "@user.build_member:#{@user.build_member}"
    # logger.debug "@member.id:#{@member.id}"
    # logger.debug "@member.nickname:#{@member.nickname}"
    
  end

  def create 
    @user =User.create(user_params)
    p "eeeeeeeeee"
    @user.errors.full_messages.each do |ee| 
      p ee  
    end
    p "eeeeeeeeee"

    if @user.save
      redirect_to root_url, notice:"新規ユーザーを登録しました"
    else
      logger.debug "@user.save:#{@user.save}"
      # redirect_to root_url, notice:"登録できません"
      # @member = current_user.member
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
                        :user_id,
                        :fullhour,
                        :fullmin,
                        :fullsec,
                        :halfhour,
                        :halfmin,
                        :halfsec]
                        )
  end


end
