class Members::MembersController < ApplicationController
  before_action :authenticate_member!

  def show
    @member = current_member
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    if @member.update(member_params)
      redirect_to member_path(@member.id), notice: "プロフィールを変更しました"
    else
      render :edit
    end
  end

  def withdraw
    @member = current_member
    @member.update(is_active: false)
    reset_session
    redirect_to root_path
  end


  private
  def member_params
    params.require(:member).permit(:name, :profile, :profile_image)
  end

end