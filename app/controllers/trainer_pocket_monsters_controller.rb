class TrainerPocketMonstersController < ApplicationController
  def index
    @trainer = Trainer.find(params[:id])
    # Call alphabetical_monsters method here
  end

  def new
    @trainer = Trainer.find(params[:id])
    render :new
  end

  def create
    @trainer = Trainer.find(params[:id])
    @pocket_monster = @trainer.pocket_monsters.create(pm_params)

    redirect_to "/trainers/#{@trainer.id}/pocket_monsters"
  end

  def destroy
    @trainer = Trainer.find(params[:id])
    @pocket_monster = @trainer.pocket_monsters.find(pm_params)
    @pocket_monster.destroy

    redirect_to "/trainers/#{@trainer.id}/pocket_monsters"
  end

  private

  def pm_params
    params.permit(:id, :name, :level, :captured, :trainer_id)
  end
end
