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


    @training_data = current_user.steps.where(created_at: (30.days.ago)..(Time.now), training:['筋トレ','ランニング','ストレッチ','その他スポーツ'])
    @pre_training_ave = Step.where(created_at: (30.days.ago)..(Time.now), training:['筋トレ','ランニング','ストレッチ','その他スポーツ']).group('training').count
    @users = User.all
    @recent_users = @users.where(created_at: (7.days.ago)..(Time.now))
    @training_ave = Hash.new()
    @pre_training_ave.each{|key, value|
      @training_ave[key] = value / (@users.count - @recent_users.count )
    }


    @step_ex = current_user.steps.where(created_at: (30.days.ago)..(Time.now))
    @step_exvalue = ((@step_ex.sum(:step_num) * 0.6)/4000)*3


    @training_exvalue = current_user.steps.where(created_at: (30.days.ago)..(Time.now), training:['筋トレ','ランニング','ストレッチ','その他スポーツ']).group('training').count


    @training_exvalue.each{|key, value|
      if key == "筋トレ"
        value = 3 * value
      elsif key == "ランニング"
        value = 3 * value
      elsif key == "ストレッチ"
        value = 1.5 * value
      elsif key == "その他スポーツ"
        value = 5 * value
      end
      @training_exvalue[key] = value
    }

    @exvalue = @training_exvalue
    @exvalue["歩数"] = @step_exvalue
  end

  def create
    Step.create(create_params)
    Insurance.create(create_fee)
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
    @insurance = current_user.insurances.last
    @insurance.update(update_fee)
  end


  private
  def create_params
    params.require(:step).permit(:step_num, :training).merge(user_id: current_user.id)
  end

  def step_params
    params.require(:step).permit(:step_num, :training)
  end

  def create_fee
    @hash = Hash.new()
    @ex_fee = current_user.insurances.last
    @today_step = current_user.steps.last

    exercise_value = (( @today_step.step_num * 0.6)/4000)*3

    if @today_step.training == "筋トレ"
      exercise_value += 6 * 0.5
    elsif @today_step.training == "ランニング"
      exercise_value += 6 * 0.5
    elsif @today_step.training == "その他スポーツ"
      exercise_value += 5
    elsif @today_step.training == "ストレッチ"
      exercise_value += 3 * 0.5
    else
      exercise_value += 0
    end
    exercise_value -= 4
    @hash[:fee] = @ex_fee.fee - exercise_value * 10

    @hash[:user_id] = current_user.id
    return @hash
  end

  def update_fee
    @hash = Hash.new()
    @today_step = current_user.steps.last
    exercise_value = (( @today_step.step_num * 0.6)/4000)*3

    if @today_step.training == "筋トレ"
      exercise_value += 6 * 0.5
    elsif @today_step.training == "ランニング"
      exercise_value += 6 * 0.5
    elsif @today_step.training == "その他スポーツ"
      exercise_value += 5
    elsif @today_step.training == "ストレッチ"
      exercise_value += 3 * 0.5
    else
      exercise_value += 0
    end
    exercise_value -= 4
    @hash[:fee] = @insurance.fee - exercise_value * 10

    @hash[:user_id] = current_user.id
    @insurance = @hash
    return @hash
  end



end
