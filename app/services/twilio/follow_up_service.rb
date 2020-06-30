module Twilio
  class FollowUpService < BaseService

    def send_message
      client.messages.create(message)
    end

    private

    def message
      params[:message]
    end

    def client
      @client ||= Twilio::Client.new(patient: patient)
    end
  end
end