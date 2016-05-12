class FitnessesController < ApplicationController
  def search
  end

  def results
    if params[:place].present? then
      @fitnesses = Fitness.where('place LIKE(?)',"%#{params[:place]}%")
    elsif params[:purpose].present? then
      @fitnesses = Fitness.where('detail LIKE(?)',"%#{params[:purpose]}%")
    elsif params[:keyword].present? then
      @fitnesses = Fitness.where('detail LIKE(?)',"%#{params[:keyword]}%")
    elsif params[:keyword].empty? then
      @fitnesses = Fitness.all
    end
    @hits_num = @fitnesses.count
  end

  def show
    @fitness = Fitness.find(params[:id])
    @company = @fitness.company
  end
end
