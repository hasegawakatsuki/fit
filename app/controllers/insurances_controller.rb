class InsurancesController < ApplicationController
  before_action :authenticate_user!
  def index
    @pre_fee = current_user.insurances.where(created_at: (30.days.ago)..(Time.now)).group('date(created_at)').sum(:fee)
    @fee_data = Hash.new()
    @pre_fee.each{|key, value|
      key = key.strftime('%Y/%m/%d')
      @fee_data[key] = value
    }
  end
end
