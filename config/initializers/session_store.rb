# frozen_string_literal: true

Rails.configuration.session_store(
  :redis_store,
  servers: ["#{ENV.fetch('REDIS_URL')}/0/session"],
  expire_after: 1.day,
  key: '_rails_docker_template_session',
  secure: Rails.env.production?
)
