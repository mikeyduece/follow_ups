web: bundle exec puma -t 5:5 -p ${PORT:-5000} -e ${RACK_ENV:-development}
worker: bundle exec sidekiq -q default -q mailers
release: bundle exec rails db:migrate