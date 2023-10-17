class PocketMonstersController < ApplicationController
  def index
    @pocket_monsters = PocketMonster.all
  end

  def show
    @pocket_monster = PocketMonster.find(params[:id])
  end

  def edit
    @pocket_monster = PocketMonster.find(params[:id])
  end

  def update
    @pocket_monster = PocketMonster.find(params[:id])

    if @pocket_monster.update(pm_params)
      flash[:success] = "Pocket Monster information updated successfully."
      redirect_to "/pocket_monsters/#{@pocket_monster.id}"
    else
      flash[:error] = "Trainer information not updated. Please fill out the entire form."
      redirect_to "/pocket_monsters/#{@pocket_monster.id}/edit"
    end
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
