class GroupsController < ApplicationController
  before_action :set_group, except: %i[create index]

  def index
    @groups = policy_scope(Group)
    @users = User.where.not(id: current_user.id)

    render json: { groups: @groups, users: @users }, status: :ok
  end

  def show
    authorize @group

    render json: {
      status: :ok,
      data: @group
    }
  end

  def create
    @group = Group.new(group_params)
    authorize @group
    if @group.save
      add_members(@group, params[:selectedUsers])
      if @group.users.count == params[:selectedUsers].count + 1
        render json: {
          group: @group
        }, status: :ok, message: "Group Created"
      else
        render json: { errors: "Something went Wrong" }
      end
    else
      render json: { errors: @group.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    authorize @group

    if @group.update(group_params)
      render json: {
        status: { code: 200, message: "Group Updated" },
        data: @group
      }
    else
      render json: { errors: @group.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @group

    if @group.destroy
      render json: {
        status: { code: 200, message: "Group Destroyed" }
        # redirect?
      }
    else
      render json: {
        errors:
      }, status: :unprocessable_entity
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def add_members(group, selected_members)
    GroupMember.create(user: current_user, group: group, admin: true)
    selected_members.each do |member_id|
      user = User.find(member_id)
      GroupMember.create(user: user, group: group, admin: false)
    end
  end
end
