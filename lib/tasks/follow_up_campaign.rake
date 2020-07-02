namespace :follow_up_campaign do
  desc 'Send follow up messages to at risk patients, ensuring they are ok and to schedule another visit if need be'
  task send_sms: :environment do
    Campaigns::FollowUpWorker.perform_async(1,3)
  end
end