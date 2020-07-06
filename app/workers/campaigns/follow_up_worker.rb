module Campaigns
  class FollowUpWorker
    include Sidekiq::Worker
    sidekiq_options retry: true, count: 3

    def perform(count, interval, name)
      Twilio::FollowUpService.call(count, interval, name)
    end
  end
end