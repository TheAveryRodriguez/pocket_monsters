class TrainerPocketMonstersController < ApplicationController
  def index
    @trainer = Trainer.find(params[:id])
  end

  def new
    @trainer = Trainer.find(params[:id])
    render :new
  end

  def create
    @pocket_monster = PocketMonster.create(pm_params)

    redirect_to "/trainers/#{trainer.id}/pocket_monsters"
  end

  private

  def pm_params
    params.permit(:id, :name, :level, :captured)
  end
end
