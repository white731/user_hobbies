class HobbiesController < ApplicationController

  before_action :set_hobby, only: [:show, :edit, :update]

  def index
    @hobbies = Hobby.all
  end

  def show
  end

  def edit
  end

  def update
    if @hobby.update(hobby_params)
      redirect_to hobbies_path
    else
      render :edit
    end
  end

  def new
    @hobby = Hobby.new
  end

  def create
    # one way to create an account does not santize
    # current_user.accounts.create(name: params[:account][:name], balance: params[:account][:balance])
    @hobby = current_user.hobbies.new(hobby_params) #create this
    if @hobby.save
      # flash[:success] = "Account Created"
      redirect_to hobbies_path
    else
      # flash[:error] = "Error #{@account.errors.full_messages.join(", ")}"
      render :new
    end
  end

  def destroy
    @hobby.destroy
    redirect_to hobbies_path
  end

  private

  def hobby_params
    params.require(:hobby).permit(:name, :body)
  end

  def set_hobby
    @hobby = current_user.hobbies.find(params[:id])
  end

end
