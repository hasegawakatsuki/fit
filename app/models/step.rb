class Step < ActiveRecord::Base
  belongs_to :user


  # 今日投稿された Post を取得
  scope :created_today, -> { where("created_at >= ?", Time.zone.now.beginning_of_day) }

end
