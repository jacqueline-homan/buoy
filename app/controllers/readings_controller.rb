require 'pp'

class ReadingsController < ApplicationController
  def new
    @reading = Reading.new
  end

  def create
    @reading = Reading.new(reading_params)

    if @reading.valid?
      # serialize the object into a cookie
      #
      # redirect_to :show
    else
      # errors here: @reading.errors.messages
      # also look at @reading.errors.full_messages

      # flash.now[:error] = "There was a problem with your submission"

      # re-render new action and display flash error (maybe highlight the invalid fields)
    end
  end

  def show
    # pull the reading model out of the cookie
    #
    # display the final result -- you'll need to add stats methods
    # to the Reading model and use the reading model to fetch data
    # via the WeatherClient
  end

  private

  def reading_params
    params.require(:reading).permit(:start_date, :end_date)
  end
end


