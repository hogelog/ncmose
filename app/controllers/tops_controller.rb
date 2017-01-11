class TopsController < ApplicationController
  def show
    @novels = Novel.all
  end
end
