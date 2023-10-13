class TrainersController < ApplicationController
  def index
    @trainers = Trainer.all
  end

  def show
    @trainer = Trainer.find(params[:id])
  end

  def new
    render :new
  end

  def create
    @trainer = Trainer.create(trainer_params)
    redirect_to "/trainers"
  end

  private

  def trainer_params
    params.permit(:id, :name, :age, :leader)
  end
end
