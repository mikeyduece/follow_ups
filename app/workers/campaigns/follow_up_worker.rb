module Campaigns
  class FollowUpWorker
    include Sidekiq::Worker
    sidekiq_options retry: true, count: 3

    def perform(start_at, end_at)
      patients = Patient.by_follow_up_interval(start_at: start_at, end_at: end_at)
      send_sms(patients)
    end

    private

    def send_sms(patients)
      patients.find_each { |p| twilio_client(p).send_message }
    end

    def twilio_client(patient)
      @twilio_client ||= Twilio::Client.new(patient: patient)
    end

  end
end