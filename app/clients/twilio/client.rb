module Twilio
  class Client < Base

    def send_message
      client.studio.v2.flows('FW3df95bbc514da4c1214241a71fed2674').executions.create(from: credentials[:twilio_number], to: patient.phone, parameters: '{"name": "Mike" }')
    end

    private

    def client
      @client ||= Twilio::REST::Client.new(credentials[:twilio_account_sid], credentials[:twilio_auth_token])
    end

    def credentials
      Rails.application.credentials
    end
  end
end