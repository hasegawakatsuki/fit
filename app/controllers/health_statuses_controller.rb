class HealthStatusesController < ApplicationController
  def new
    @health_status = HealthStatus.new
  end

  def create
    HealthStatus.create(create_params)
    Insurance.create(create_fee_params)
    redirect_to :root
  end

  private
  def create_params
    params.require(:health_status).permit(:medical_history, :illness, :weight, :height, :blood_pressure, :fat_percentage).merge(user_id: current_user.id)
  end

  def create_fee_params
    age = current_user.age
    @hash = Hash.new()
    if age >= 60
      @hash[:fee] = 8000
    elsif age >= 50
      @hash[:fee] = 5500
    elsif age >=40
      @hash[:fee] = 4500
    elsif age >= 30
      @hash[:fee] = 3500
    elsif age >= 20
      @hash[:fee] = 3000
    else
      @hash[:fee] = 2000
    end
    @hash[:user_id] = current_user.id
    return @hash
  end
end
