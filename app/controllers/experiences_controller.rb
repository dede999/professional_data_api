class ExperiencesController < ApplicationController
  include ApplicationHelper
  before_action :password, only: [:create, :update, :destroy]
  before_action :set_experience, only: [:show, :update, :destroy]

  # GET /experiences
  def index
    @experiences = Experience.all

    render json: @experiences
  end

  # GET /experiences/1
  def show
    render json: @experience
  end

  # POST /experiences
  def create
    @experience = Experience.new(experience_params)

    if @auth_errors.any?
      render json: @auth_errors, status: :unauthorized
    elsif @experience.save
      render json: @experience, status: :created, location: @experience
    else
      render json: @experience.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /experiences/1
  def update
    if @auth_errors.any?
      render json: @auth_errors, status: :unauthorized
    elsif @experience.update(experience_params)
      render json: @experience
    else
      render json: @experience.errors, status: :unprocessable_entity
    end
  end

  # DELETE /experiences/1
  def destroy
    if !@auth_errors.empty?
      render json: @auth_errors, status: :unauthorized
    else
      @experience.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience
      @experience = Experience.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def experience_params
      params.require(:experience).permit(:title, :first_day, :last_day,
                                         :description, :company)
    end
end
