class EpisodesController < ApplicationController
  def show(novel_id, id)
    @episode = Episode.find(id)
  end
end
