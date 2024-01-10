require 'rails_helper'

RSpec.describe "Brokers", type: :request do
  
  it "returns http success" do
    get "/"
    expect(response.code).to eq("200")
  end

  it "returns get the information" do
    get "/"
    expect(response.body).to include("content")
  end

  it "returns get the information" do
    get "/"
    expect(response.body).to include("pagination")
  end
  
end
