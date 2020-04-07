# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

env :PATH, "#{ENV["PATH"]}:#{Dir.pwd}/bin"

set :output, { :error => "#{Dir.pwd}/log/cron_error_log.log", :standard => "#{Dir.pwd}/log/cron_log.log" }

case @environment
when "production"
  every 1.day, at: "6:00 am", :roles => [:app] do
    rake "sitemap:generate"
  end

  every 1.day, at: "4:00 am", :roles => [:app] do
    command "cd #{Dir.pwd}/public/system/b8545e1a72a8ca899b491ea2b6e0/; wget -q -N --timestamping https://images.provenexpert.com/ba/01/b8545e1a72a8ca899b491ea2b6e0/widget_square_165_de_1.png"
  end

  every 1.day, at: "5:00 am", :roles => [:app] do
    #command 'backup perform --trigger xxx_backup'
  end
end
