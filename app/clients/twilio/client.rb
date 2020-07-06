module Twilio
  class Client < Base
    def send_message
      client.studio.v2.flows(credentials[:twilio_studio_flow_sid]).executions.create(from: credentials[:twilio_number], to: patient.phone, parameters: '{"name": "Mike" }')
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