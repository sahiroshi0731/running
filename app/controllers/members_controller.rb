class MembersController < ApplicationController
  
  def index
    @members = Member.all
    # @members.each do |member|
      # p "++str"
      # p member.id
      # p member.user_id
      # p Member.find_by(user_id: member.user_id).user.name
      # p "++end"
    # end  
  end

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
