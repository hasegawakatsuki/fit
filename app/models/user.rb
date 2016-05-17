class User < ActiveRecord::Base
  has_many :steps
  has_many :insurances
  has_many :health_status
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def age
    d1=self.birth_date.strftime("%Y%m%d").to_i
    d2=Date.today.strftime("%Y%m%d").to_i
    return (d2 - d1) / 10000
  end

  def step_average
    steps.average(:step_num).round
  end

  def current_fee
    insurances.last.fee
  end

  def today_input
    steps.created_today
  end
end
