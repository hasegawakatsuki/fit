class HealthStatusesController < ApplicationController
  def new
    @health_status = HealthStatus.new
  end
  def create
    HealthStatus.create(create_params)
    redirect_to :root
  end

  private
  def create_params
    params.require(:health_status).permit(:medical_history, :illness, :weight, :height, :blood_pressure, :fat_percentage).merge(user_id: current_user.id)
  end
end
