class PocketMonstersController < ApplicationController
  def index
    @pocket_monsters = PocketMonster.all
  end
end
