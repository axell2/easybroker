require 'uri'
require 'net/http'

class Broker 
  def self.request(url)
    if url.nil?
      url = URI("https://api.stagingeb.com/v1/contact_requests?page=1&limit=20")
    else
      url = URI("#{url}")
    end
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request["accept"] = 'application/json'
    request["X-Authorization"] = ENV['API_KEY']
    response = http.request(request)
    response_obj = JSON.parse(response.body)
  end

  def self.get_all_contact_requests_content(url)
    response_obj = request(url)
    rate = response_obj["content"]
  end

  def self.get_pagination(url)
    response_obj = request(url)
    rate = response_obj["pagination"]
  end
end