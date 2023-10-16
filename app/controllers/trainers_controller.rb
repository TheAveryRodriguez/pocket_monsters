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

  def edit
    @trainer = Trainer.find(params[:id])
  end

  def update
    @trainer = Trainer.find(params[:id])

    if @trainer.update(trainer_params)
      flash[:success] = "Trainer information updated successfully."
      redirect_to "/trainers/#{@trainer.id}"
    else
      flash[:error] = "Trainer information not updated. Please fill out the entire form."
      redirect_to "/trainers/#{@trainer.id}/edit"
    end
  end

  private

  def trainer_params
    params.permit(:id, :name, :age, :leader)
  end
end
