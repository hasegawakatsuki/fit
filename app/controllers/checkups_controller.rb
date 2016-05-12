class CheckupsController < ApplicationController
  def search
  end

  def results
    if params[:place].present? then
      @checkups = Checkup.joins(:hospital).where('place LIKE(?)',"%#{params[:place]}%")
    elsif params[:purpose].present? then
      @checkups = Checkup.where('name LIKE(?)',"%#{params[:purpose]}%")
    elsif params[:keyword].present? then
      @checkups = Checkup.where('detail LIKE(?)',"%#{params[:keyword]}%")
    elsif params[:keyword].empty? then
      @checkups = Checkup.all
    end
    @hits_num = @checkups.count
  end

  def show
    @checkup = Checkup.find(params[:id])
    @hospital = @checkup.hospital
  end
end
