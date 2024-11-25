class ComplimentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_compliment, only: [:edit, :update]

  def index
    @compliment = Compliment.order('RANDOM()').first
  end

  def new
    @compliment = Compliment.new
  end

  def create
    @compliment = current_user.compliments.build(compliment_params)
    if @compliment.save
      redirect_to root_path, notice: "Compliment added!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @compliment.update(compliment_params)
      redirect_to root_path, notice: "Compliment updated!"
    else
      render :edit
    end
  end

  private

  def set_compliment
    @compliment = current_user.compliments.find(params[:id])
  end

  def compliment_params
    params.require(:compliment).permit(:message)
  end
end
