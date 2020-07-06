module Campaigns
  class FollowUpCampainsController < ApplicationController

    def create
      Twilio::FollowUpService.call(params) do |success, failure|
        success.call { 'Created campaign' }
        failure.call { |_error| 'Something went wrong' }
      end

    end
  end
end