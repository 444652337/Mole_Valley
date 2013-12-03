class Admin::EventsController < Admin::ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy]

  def index
    @events = Event.order("id desc").all
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def show
  end

  def create
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to admin_events_path, notice: 'New event has been saved.' }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @event = Event.find(params[:id])
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to admin_events_path, notice: 'Event has been updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to admin_events_path }
      format.json { head :no_content }
    end
  end

  private
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:content)
  end
end