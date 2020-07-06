module Twilio
  class Client < Base
    def send_message(opts = {})
      client.studio.v2.flows(credentials[:twilio_studio_flow_sid]).executions
         .create(from: credentials[:twilio_number], to: patient.phone,
                 parameters: { "latitude": "#{opts[:lat]}", "longitude": "#{opts[:long]}" })
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