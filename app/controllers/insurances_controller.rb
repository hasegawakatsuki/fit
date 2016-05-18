class InsurancesController < ApplicationController
  before_action :authenticate_user!
  def index
    @pre_fee = current_user.insurances.where(created_at: (30.days.ago)..(Time.now)).group('date(created_at)').average(:fee)
    @fee_data = Hash.new()
    @pre_fee.each{|key, value|
      key = key.strftime('%Y/%m/%d')
      @fee_data[key] = value
    }
    @last_fee = current_user.insurances.last
    @first_fee = current_user.insurances.first
    @lastmonth_fee = current_user.insurances.where(created_at: (31.days.ago)..(30.days.ago)).sum(:fee)
    @yesterday_fee = current_user.insurances.where(created_at: (2.days.ago)..(1.days.ago)).sum(:fee)
  end

  def registration
    webpay = WebPay.new(WEBPAY_SECRET_KEY)
    customer = webpay.customer.create(card: params['webpay-token'])
    @user = User.find(current_user.id)
    @user.update(customer_id: customer.id)
    redirect_to controller: :users, action: :show
  end


  def recursion
    @fee = current_user.insurances.last
    webpay = WebPay.new(WEBPAY_SECRET_KEY)
    webpay.recursion.create(
       amount: @fee.fee,
       currency: "jpy",
       customer: current_user.customer_id,
       period: :month,
       description: "Fit保険料"
    )
    redirect_to controller: :users, action: :show
  end

end
