class TracksController < ApplicationController

  before_action :set_track, only: [:show, :edit, :update, :destroy]

  before_action only: [:show_user_track, :course_details] do
    check_allowed_roles(current_user, ["student","assistant","teacher","admin"])
  end
  before_action except: [:show_user_track, :course_details] do
    check_allowed_roles(current_user, ["assistant","teacher","admin"])
  end

  layout "admin", except: [:show_user_track, :course_details]

  def index
    @tracks = Track.all
  end

  def show
  end

  def show_user_track
    @track = Track.find(params[:id] || 1)
  end

  def new
    @track = Track.new
  end

  def edit
  end

  def create
    @track = Track.new(track_params)

    respond_to do |format|
      if @track.save
        format.html { redirect_to @track, notice: 'Track was successfully created.' }
        format.json { render :show, status: :created, location: @track }
      else
        format.html { render :new }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to @track, notice: 'Track was successfully updated.' }
        format.json { render :show, status: :ok, location: @track }
      else
        format.html { render :edit }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @track.destroy
    respond_to do |format|
      format.html { redirect_to tracks_url, notice: 'Track was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_track
      @track = Track.find(params[:id])
    end

    def track_params
      params.require(:track).permit(:name, :duration, :description, :syllabus)
    end
end
