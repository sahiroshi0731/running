class MembersController < ApplicationController
  
  def show
    @user = User.find(current_user.id)
    @member = @user.member
  end  
  
  def edit
    @member = Member.find(params[:id])
  end  
  
  def update
    member = Member.find(params[:id])
    member.update(update_params)
    redirect_to records_path, notice:"更新できました"
  end  
  
  private
  def update_params
    params.require(:member).permit(:nickname, 
                                   :maintitle, 
                                   :sex,
                                   :fullhour,
                                   :fullmin,
                                   :fullsec,
                                   :halfhour,
                                   :halfmin,
                                   :halfsec)
  end  

end
