module Campaigns
  class FollowUpWorker
    include Sidekiq::Worker
    sidekiq_options retry: true, count: 3

    def perform(start_at, end_at, name)
      Twilio::FollowUpService.call(start_at, end_at, name)
    end
  end
end