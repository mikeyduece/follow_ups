module Campaigns
  class FollowUpCampainsController < ApplicationController

    def create
      Campaigns::FollowUpWorker.perform_async(params[:count], params[:interval], params[:name])
    end
  end
end