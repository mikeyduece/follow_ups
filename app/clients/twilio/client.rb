module Twilio
  class Client < Base

    def client
      @client ||= Twilio::REST::Client.new(
          from: Rails.application.credentials[:twilio_number],
          to: patient.phone,
          body: "Hello just checking in on you since our last visit. Is there anything you need?"
      )
    end
  end
end