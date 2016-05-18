class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
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

    @pre_fee = current_user.insurances.where(created_at: (30.days.ago)..(Time.now)).group('date(created_at)').average(:fee)
    @fee_data = Hash.new()
    @pre_fee.each{|key, value|
      key = key.strftime('%Y/%m/%d')
      @fee_data[key] = value
    }
  end
end
