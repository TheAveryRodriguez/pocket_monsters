class TrainerPocketMonstersController < ApplicationController
  def index
    @trainer = Trainer.find(params[:id])
    # @pocket_monsters = @trainer.pocket_monsters
    @pocket_monsters = if params[:sort] == "asc"
      @trainer.alphabetical_monsters
    elsif !params[:level].nil?
      @trainer.stronger_than(params[:level])
    else
      @trainer.pocket_monsters
    end
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
    @pocket_monster = PocketMonster.find(params[:id])
    @pocket_monster.destroy

    redirect_to "/pocket_monsters"
  end

  private

  def pm_params
    params.permit(:id, :name, :level, :captured, :trainer_id)
  end
end
