module Campaigns
  class FollowUpCampainsController < ApplicationController

    def create
      Campaigns::FollowUpWorker.perform_async(params[:start_at], params[:end_at], params[:name])
    end
  end
end