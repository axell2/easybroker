class MainController < ApplicationController
  def home
    url = params[:url]
    @contact_requests = Broker.get_all_contact_requests_content(url)
    @pagination = Broker.get_pagination(url)
    @page = @pagination["page"].to_i 
    @actual_page = "https://api.stagingeb.com/v1/contact_requests?limit=20&page=#{@page}"
    if @page >= 2
      @previous_page = "https://api.stagingeb.com/v1/contact_requests?limit=20&page=#{@page-1}"
    end
  end
end
