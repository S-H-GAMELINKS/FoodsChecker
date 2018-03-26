desc "This task is called by the Heroku scheduler add-on"
task :expired_test => :environment do
  puts "expired test"
  puts "it works."
end

task :expired => :environment do

    require 'net/http'
require 'uri'

    class Line
        TOKEN = ENV["LINE_ID"]
        URI = URI.parse("https://notify-api.line.me/api/notify")

        def make_request(msg)
            request = Net::HTTP::Post.new(URI)
            request["Authorization"] = "Bearer #{TOKEN}"
            request.set_form_data(message: msg)
            request
        end

        def send(msg)
            request = make_request(msg)
            response = Net::HTTP.start(URI.hostname, URI.port, use_ssl: URI.scheme == "https") do |https|
                https.request(request)
            end
        end
    end

    @foods = Food.find(Food.ids)

    line = Line.new

    @foods.each do |food|
        if food.date == Date.today then
            message = ("賞味期限が近い食品:#{food.name}がありますよ！ #{food.picture} #{ENV["WEB_APP_URL"]}")
            line.send(message)
        end
    end
end