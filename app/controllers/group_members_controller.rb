class GroupMembersController < ApplicationController
  before_action :set_group, except: %i[create destroy ]

  def create
    @group_member = GroupMember.new(group_member_params)
    authorize @group_member

    if @group_member.save
      render json: {
        status: { code: 200, message: "Group Member Created" },
        data: @group_member
      }
    else
      render json: { errors: @group_member.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    authorize @group_member

    if @group_member.update(group_member_params)
      render json: {
        status: { code: 200, message: "Group Member Updated" },
        data: @group_member
      }
    else
      render json: { errors: @group_member.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @group_member

    if @group_member.destroy
      render json: {
        status: { code: 200, message: "Group Member Destroyed" }
        # redirect?
      }
    else
      render json: {
        errors:
      }, status: :unprocessable_entity
    end
  end

  private

  def group_member_params
    params.require(:group_member).permit(:user_id, :group_id, :admin)
  end

  def set_group_member
    @group_member = GroupMember.find(params[:id])
  end
end
