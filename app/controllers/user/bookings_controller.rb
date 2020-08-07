class User::BookingsController < ApplicationController
    def index
      @bookings = policy_scope([:user, Booking])
    end
  end
  