class Admin::ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end
  def new
    @activity = Activity.new
    2.times { @activity.ticket_types.build }
  end
end