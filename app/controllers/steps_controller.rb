class StepsController < ApplicationController
  before_action :authenticate_user!
  def index
    @step = Step.new

    @pre_data = current_user.steps.where(created_at: (30.days.ago)..(Time.now)).group('date(created_at)').sum(:step_num)
    @step_data = Hash.new()
    @pre_data.each{|key, value|
      key = key.strftime('%Y/%m/%d')
      @step_data[key] = value
    }

    @pre_ave = Step.where(created_at: (30.days.ago)..(Time.now)).group('date(created_at)').average(:step_num)
    @ave_data = Hash.new()
    @pre_ave.each{|key, value|
      key = key.strftime('%Y/%m/%d')
      @ave_data[key] = value
    }
  end

  def create
    Step.create(create_params)
    redirect_to controller: :steps, action: :index
  end

  def edit
    @today_step = Step.find(params[:id])
  end

  def update
    step = Step.find(params[:id])
    if step.user_id == current_user.id
      step.update(step_params)
    end
  end


  private
  def create_params
    params.require(:step).permit(:step_num, :training).merge(user_id: current_user.id)
  end

  def step_params
    params.require(:step).permit(:step_num, :training)
  end



end
