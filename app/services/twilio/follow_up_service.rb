module Twilio
  class FollowUpService < BaseService

    def call
      set_patients
      send_messages
    end

    private

    def send_messages
      campaign.patients.allowed.find_each do |patient|
        client = client(patient)
        client.send_message
      end
    end

    def set_patients
      campaign.patients = patients
      campaign.patients.reload
    end

    def patients
      Patient.by_follow_up_interval(count, interval)
    end

    def campaign
      @campaign ||= FollowUpCampaign.find_or_create_by(name: "#{count} #{interval} follow up #{Time.now.utc.to_date}")
    end

    def message
      params[:message] || campaign.default_message
    end

    def client(patient)
      Twilio::Client.new(patient: patient)
    end
  end
end