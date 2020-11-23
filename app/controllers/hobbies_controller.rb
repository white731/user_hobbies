class HobbiesController < ApplicationController
  def index
    @hobbies = Hobby.all
  end

  def show
  end

  def edit
  end

  def new
  end
end
