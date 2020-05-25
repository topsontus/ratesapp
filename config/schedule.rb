set :output, File.join(Whenever.path, "log", "cron.log")

ENV.each { |k, v| env(k, v) }

set :environment, 'development'

every 1.day, at: '8:45 pm' do
  runner 'ImportRateWorker.perform_async'
end
