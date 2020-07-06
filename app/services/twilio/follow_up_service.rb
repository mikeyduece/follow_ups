module Twilio
  class FollowUpService < BaseService

    def call(&block)
      set_patients
      send_messages

      yield
    rescue StandardError => e
      yield(e)
    end

    private

    def send_messages
      campaign.patients.allowed.find_each do |patient|
        client = client(patient)
        client.messages.create(message)
      end
    end

    def set_patients
      campaign.patients = patients
      campaign.patients.reload
    end

    def patients
      Patient.by_follow_up_interval(1,3)
    end

    def campaign
      FollowUpCampaign.create(name: params[:name])
    end

    def message
      params[:message] || campaign.default_message
    end

    def client(patient)
      @client ||= Twilio::Client.new(patient: patient)
    end
  end
end