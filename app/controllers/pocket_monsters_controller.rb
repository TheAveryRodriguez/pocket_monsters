class PocketMonstersController < ApplicationController
  def index
    @pocket_monsters = PocketMonster.all
  end

  def show
    @pocket_monster = PocketMonster.find(params[:id])
  end
end
