module Twilio
  class Client < Base

    def send_message
      client.messages.create(
         from: Rails.application.credentials[:twilio_number],
         to: patient.phone,
         body: "Hello just checking in on you since our last visit. Is there anything you need?"
      )
    end

    private

    def client
      @client ||= Twilio::REST::Client.new
    end
  end
end