namespace :follow_up_campaign do
  desc 'Send follow up messages to at risk patients, ensuring they are ok and to schedule another visit if need be'
  task send_sms: :environment do
    Campaigns::FollowUpWorker.new.perform(1, :week, "1 Day #{Time.now.utc}")
  end
end