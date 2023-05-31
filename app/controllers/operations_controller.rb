class OperationsController < ApplicationController
  def index
    @group = Group.find_by(user: current_user, id: params[:group_id])
    @operations = @group.operations.order(created_at: :desc)
  end

  def new
    @operation = Operation.new
    @groups = Group.all.where(user: current_user)
  end

  def create
    @operation = Operation.new(operation_params)
    @groups = params[:groups]
    @groups.each do |id|
      group = Group.find(id) unless id == ''
      @operation.groups.push(group) unless group.nil?
    end
    # @groups = Group.all.where(user: current_user)
    @operation.author = current_user
    puts @operation.groups
    if @operation.save
      redirect_to group_operations_path
      flash[:notice] = 'Operation created successfully'
    else
      flash[:error] = "Can't be blank, record didn't get saved"
      render :new
    end
  end

  private

  def operation_params
    params.require(:operation).permit(:name, :amount)
  end
end
